<?php

declare(strict_types = 1);

namespace Gera;

use Gera\DataObject\CurrencyRate;
use Gera\Exception\CurrencyRatesNotFound;
use Gera\Exception\CurrencyRatesMatrixNotFound;
use Gera\Exception\UnknownCurrenciesLetterException;

/**
 * Class CurrencyRatesRepository
 *
 * @package Gera
 */
class CurrencyRatesRepository
{
    /**
     * @var CurrencyRatesSqlRepository
     */
    private $repository;

    /**
     * @var CurrencyRepository
     */
    private $currency_repository;

    /**
     * @var float[][]
     */
    private $currencyRatesMatrix = [];

    /**
     * Матрица базовых курсов по последнему снапшоту
     *
     * @var CurrencyRate[][]
     */
    private $currencyRatesObjMatrix = [];

    /**
     * Матрица базовых курсов по снапшотам
     *
     * @var CurrencyRate[][]
     */
    private $currencyRatesMatrixForInterval = [];

    /**
     * Список соответствия currency_rate_id snapshot_id
     *
     * @var int[]
     */
    private $snapshotIdsListByCurrencyRateId = [];

    /**
     * Текущий snapshot_id
     *
     * @var int
     */
    private $ActualSnapshotId;

    /**
     * @var int
     */
    private $request_timeout;

    /**
     * CurrencyRatesRepository constructor.
     *
     * @param CurrencyRatesSqlRepository $repository
     * @param CurrencyRepository         $currencyRepository
     * @param int                        $request_timeout
     *
     * @throws Exception\MissingKeyException
     * @throws UnknownCurrenciesLetterException
     */
    public function __construct(
        CurrencyRatesSqlRepository $repository,
        CurrencyRepository $currencyRepository,
        int $request_timeout = PHP_INT_MAX
    ) {
        $this->repository = $repository;
        $this->setRequestTimeout($request_timeout);
        $this->currency_repository = $currencyRepository;

        $this->build();
    }

    /**
     * @param int $request_timeout
     *
     * @return $this
     */
    public function setRequestTimeout(int $request_timeout): CurrencyRatesRepository
    {
        $this->request_timeout = $request_timeout;

        return $this;
    }

    /**
     * Возвращает курсовой мультипликатор
     *
     * @param int $from_local_id
     * @param int $to_local_id
     *
     * @return float
     *
     * @throws CurrencyRatesNotFound
     */
    public function getCurrencyRate(int $from_local_id, int $to_local_id): float
    {
        if (!isset($this->currencyRatesMatrix[$from_local_id][$to_local_id])) {
            throw new CurrencyRatesNotFound($from_local_id, $to_local_id);
        }

        return $this->currencyRatesMatrix[$from_local_id][$to_local_id];
    }

    /**
     * Возвращает матрицу текущих курсов, где:
     * первый ключ - локальный идентификатор валюты которую получаем,
     * второй - локальный идентификатор валюты которую отдаем,
     * значение - курсовой мультипликатор
     *
     * @return float[][]
     */
    public function getCurrencyRatesMatrix(): array
    {
        return $this->currencyRatesMatrix;
    }

    /**
     * Возвращает матрицу объектов текущих курсов, где:
     * первый ключ - локальный идентификатор валюты которую получаем,
     * второй - локальный идентификатор валюты которую отдаем,
     *
     * @return CurrencyRate[][]
     */
    public function getСurrencyRatesObjMatrix(): array
    {
        return $this->currencyRatesObjMatrix;
    }

    /**
     * @return float[][][]
     */
    public function getSnapshotIdsList(): array
    {
        return $this->snapshotIdsListByCurrencyRateId;
    }

    /**
     * @return CurrencyRate[][]
     */
    public function getCurrencyRatesMatrixForInnerPS(): array
    {
        return $this->currencyRatesMatrixForInterval;
    }

    /**
     * @return CurrencyRate[]
     *
     * @throws CurrencyRatesMatrixNotFound
     */
    public function getActualCurrencyRateMatrix(): array
    {
        return $this->getCurrencyRateMatrixBySnapshotId($this->ActualSnapshotId);
    }

    /**
     * Возвращает матрицу текущих курсов за REQUEST_COURSE_TIMEOUT_MIN по snapshot_id
     *
     * @param int $snapshot_id
     *
     * @return CurrencyRate[]
     *
     * @throws CurrencyRatesMatrixNotFound
     */
    public function getCurrencyRateMatrixBySnapshotId(int $snapshot_id): array
    {
        if (!isset($this->currencyRatesMatrixForInterval[$snapshot_id])) {
            throw new CurrencyRatesMatrixNotFound($snapshot_id);
        }

        return $this->currencyRatesMatrixForInterval[$snapshot_id];
    }

    /**
     * Возвращает snapshot_id по currency_rate_id
     *
     * @param int $currency_rate_id
     *
     * @return int
     *
     * @throws CurrencyRatesMatrixNotFound
     */
    public function getSnapshotIdByCurrencyRateId(int $currency_rate_id): int
    {
        if (!isset($this->snapshotIdsListByCurrencyRateId[$currency_rate_id])) {
            throw new CurrencyRatesMatrixNotFound($currency_rate_id);
        }

        return $this->snapshotIdsListByCurrencyRateId[$currency_rate_id];
    }

    /**
     * Возвращает матрицу текущих курсов по currency_rate_id
     *
     * @param int $currency_rate_id
     *
     * @return CurrencyRate[]
     *
     * @throws CurrencyRatesMatrixNotFound
     * @throws Exception\MissingKeyException
     * @throws UnknownCurrenciesLetterException
     */
    public function getCurrencyRateMatrixByCurrencyRateId(int $currency_rate_id): array
    {
        $result = $this->repository->getSnapshotIdByCurrencyRateId($currency_rate_id);

        if (!$result) {
            throw new CurrencyRatesMatrixNotFound($currency_rate_id);
        }

        $currencyRatesObjMatrix = [];

        foreach ($result as $v) {
            $v['cur_from'] = $this->currency_repository->getByCode($v['cur_from'])->getLocalId();
            $v['cur_to'] = $this->currency_repository->getByCode($v['cur_to'])->getLocalId();

            $cr = new CurrencyRate($v);

            if (!isset($currencyRatesObjMatrix[$cr->getIncomeCurrencyId()])) {
                $currencyRatesObjMatrix[$cr->getIncomeCurrencyId()] = [];
            }

            $currencyRatesObjMatrix[$cr->getIncomeCurrencyId()][$cr->getOutcomeCurrencyId()] = $cr;
        }

        return $currencyRatesObjMatrix;
    }

    /**
     * Возвращает конечный курс по переданной комиссии
     *
     * @param int   $from_local_id
     * @param int   $to_local_id
     * @param float $rate_index
     *
     * @return float
     *
     * @throws CurrencyRatesNotFound
     */
    public function getCurrencyRateFromRateIndex(int $from_local_id, int $to_local_id, float $rate_index = 0): float
    {
        if (!isset($this->currencyRatesMatrix[$from_local_id][$to_local_id])) {
            throw new CurrencyRatesNotFound($from_local_id, $to_local_id);
        }

        $rate_value = $this->currencyRatesMatrix[$from_local_id][$to_local_id] / (1 - $rate_index / 100);

        return $rate_value;
    }

    /**
     * Создает структуры для будущих запросов
     *
     * @throws Exception\MissingKeyException
     * @throws UnknownCurrenciesLetterException
     */
    private function build()
    {
        foreach ($this->repository->getCurrencyRates() as $v) {
            $cur_from = $this->currency_repository->getByCode($v['cur_from']);
            $cur_to = $this->currency_repository->getByCode($v['cur_to']);

            $cr = [
                $cur_from->getLocalId(),
                $cur_to->getLocalId(),
                (float) $v['rate_value']
            ];

            if (!isset($this->currencyRatesMatrix[$cr[0]])) {
                $this->currencyRatesMatrix[$cr[0]] = [];
            }

            $this->currencyRatesMatrix[$cr[0]][$cr[1]] = $cr[2];
            $this->ActualSnapshotId = (int) $v['snapshot_id'];
            $v['cur_from'] = $cr[0];
            $v['cur_to'] = $cr[1];

            $cr = new CurrencyRate($v);

            if (!isset($this->currencyRatesObjMatrix[$cr->getIncomeCurrencyId()])) {
                $this->currencyRatesObjMatrix[$cr->getIncomeCurrencyId()] = [];
            }

            $this->currencyRatesObjMatrix[$cr->getIncomeCurrencyId()][$cr->getOutcomeCurrencyId()] = $cr;
        }

        foreach ($this->repository->getCurrencyRatesForInnerPS($this->request_timeout) as $v) {
            $v['cur_from'] = $this->currency_repository->getByCode($v['cur_from'])->getLocalId();
            $v['cur_to'] = $this->currency_repository->getByCode($v['cur_to'])->getLocalId();

            $cr = new CurrencyRate($v);

            if (!isset($this->currencyRatesMatrixForInterval[$cr->getSnapshotId()])) {
                $this->currencyRatesMatrixForInterval[$cr->getSnapshotId()] = [];
            }

            if (!isset($this->currencyRatesMatrixForInterval[$cr->getSnapshotId()][$cr->getIncomeCurrencyId()])) {
                $this->currencyRatesMatrixForInterval[$cr->getSnapshotId()][$cr->getIncomeCurrencyId()] = [];
            }

            $this->currencyRatesMatrixForInterval[$cr->getSnapshotId()][$cr->getIncomeCurrencyId()][$cr->getOutcomeCurrencyId()] = $cr;

            $this->snapshotIdsListByCurrencyRateId[$cr->getId()] = $cr->getSnapshotId();
        }
    }
}
