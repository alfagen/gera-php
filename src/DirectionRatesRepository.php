<?php

declare(strict_types = 1);

namespace Gera;

use Gera\DataObject\DirectionRate;
use Gera\Exception\DirectionRateNotFound;
use Gera\Exception\InnerPSMatrixNotFound;
use Gera\Exception\MissingKeyException;

/**
 * Class DirectionRatesRepository
 *
 * @package Gera
 */
class DirectionRatesRepository
{
    /**
     * @var DirectionRatesSqlRepository
     */
    private $repository;

    /**
     * @var DirectionRate[]
     */
    private $directionRatesByExchangeRates = [];

    /**
     * @var DirectionRate[]
     */
    private $directionRatesByIds = [];

    /**
     * @var DirectionRate[][]
     */
    private $directionRatesByPaymentSystemsMatrix = [];

    /**
     * @var DirectionRate[]
     */
    private $floatList = [];

    /**
     * @var DirectionRate[][]
     */
    private $InnerPSDirectionRatesMatrix = [];

    /**
     * DirectionRatesRepository constructor.
     *
     * @param DirectionRatesSqlRepository $repository
     *
     * @throws Exception\MissingKeyException
     */
    public function __construct(DirectionRatesSqlRepository $repository)
    {
        $this->repository = $repository;

        $this->build();
    }

    /**
     * Возвращает DirectionRate по указанным ps_income_id и ps_outcome_id
     *
     * @param int $ps_income_id
     * @param int $ps_outcome_id
     *
     * @return DirectionRate
     * @throws DirectionRateNotFound
     */
    public function getByPaymentSystems(int $ps_income_id, int $ps_outcome_id): DirectionRate
    {
        if (!isset($this->directionRatesByPaymentSystemsMatrix[$ps_income_id][$ps_outcome_id])) {
            throw new DirectionRateNotFound(
                'DirectionRate with ps_income_id = '.$ps_income_id.' amd ps_outcome_id = '.$ps_outcome_id.' not found'
            );
        }

        return $this->directionRatesByPaymentSystemsMatrix[$ps_income_id][$ps_outcome_id];
    }

    /**
     * Возвращает DirectionRate по указанному exchange_rate_id
     *
     * @param int $exchange_rate_id
     *
     * @return DirectionRate
     * @throws DirectionRateNotFound
     */
    public function getByExchangeRateId(int $exchange_rate_id): DirectionRate
    {
        if (!isset($this->directionRatesByExchangeRates[$exchange_rate_id])) {
            throw new DirectionRateNotFound('DirectionRate with exchange_rate_id = '.$exchange_rate_id.' not found');
        }

        return $this->directionRatesByExchangeRates[$exchange_rate_id];
    }

    /**
     * Возвращает DirectionRate по указанному direction_rate_id
     *
     * @param int $direction_rate_id
     *
     * @return DirectionRate
     *
     * @throws DirectionRateNotFound
     * @throws MissingKeyException
     */
    public function getById(int $direction_rate_id): DirectionRate
    {
        $result = $this->repository->getById($direction_rate_id);

        if (!$result) {
            throw new DirectionRateNotFound('DirectionRate with direction_rate_id = '.$direction_rate_id.' not found');
        }

        return new DirectionRate($result);
    }

    /**
     * Возвращает DirectionRate по указанному direction_rate_id
     *
     * @param int $direction_rate_id
     *
     * @return DirectionRate
     *
     * @throws DirectionRateNotFound
     */
    public function getByRateId(int $direction_rate_id): DirectionRate
    {
        if (!isset($this->directionRatesByIds[$direction_rate_id])) {
            throw new DirectionRateNotFound('DirectionRate with direction_rate_id = '.$direction_rate_id.' not found');
        }

        return $this->directionRatesByIds[$direction_rate_id];
    }

    /**
     * Возвращает DirectionRate из массива рублевых курсов по указанному direction_rate_snapshot_id
     *
     * @param int $direction_rate_snapshot_id
     *
     * @return DirectionRate[]
     *
     * @throws InnerPSMatrixNotFound
     */
    public function getInnerPSMatrixBySnapshotId(int $direction_rate_snapshot_id): array
    {
        if (!isset($this->InnerPSDirectionRatesMatrix[$direction_rate_snapshot_id])) {
            throw new InnerPSMatrixNotFound('Courses to rub with snapshot_rate_id = '.$direction_rate_snapshot_id.' not found');
        }

        return $this->InnerPSDirectionRatesMatrix[$direction_rate_snapshot_id];
    }

    /**
     * Возвращает DirectionRate для входящей и исходящей ПС относительно рубля по указанному direction_rate_id
     *
     * @param int $direction_rate_id
     *
     * @return DirectionRate[]
     *
     * @throws DirectionRateNotFound
     * @throws InnerPSMatrixNotFound
     */
    public function getInnerPSToDirectionRate(int $direction_rate_id): array
    {
        if (!isset($this->directionRatesByIds[$direction_rate_id])) {
            throw new DirectionRateNotFound('DirectionRate with direction_rate_id = '.$direction_rate_id.' not found');
        }

        $dr = $this->directionRatesByIds[$direction_rate_id];
        $innerps_matrix = $this->getInnerPSMatrixBySnapshotId($dr->getDirectionSnapshotId());

        return [
            $innerps_matrix[$dr->getIncomePaymentSystemId()],
            $innerps_matrix[$dr->getOutcomePaymentSystemId()]
        ];
    }

    /**
     * Создает структуры для будущих запросов.
     *
     * @param int $inner_payment_system_id
     *
     * @throws MissingKeyException
     */
    private function build($inner_payment_system_id = 3)
    {
        foreach ($this->repository->getLastDirectionRates() as $v) {
            $dr = new DirectionRate($v);
            $this->floatList[] = $dr;
            $this->directionRatesByExchangeRates[$dr->getExchangeRateId()] = $dr;
            $this->directionRatesByIds[$dr->getId()] = $dr;

            if (!isset($this->directionRatesByPaymentSystemsMatrix[$dr->getIncomePaymentSystemId()])) {
                $this->directionRatesByPaymentSystemsMatrix[$dr->getIncomePaymentSystemId()] = [];
            }

            $this->directionRatesByPaymentSystemsMatrix[$dr->getIncomePaymentSystemId()][$dr->getOutcomePaymentSystemId()] = $dr;

            if ($inner_payment_system_id == $dr->getOutcomePaymentSystemId()) {
                $this->InnerPSDirectionRatesMatrix[$dr->getDirectionSnapshotId()][$dr->getIncomePaymentSystemId()] = $dr;
            }
        }
    }

    /**
     * Возвращает список всех последних курсов
     *
     * @return DirectionRate[]
     * @since Used in tests
     */
    private function getList(): array
    {
        return $this->floatList;
    }

    /**
     * Возращает матрицу курсов по направлениям
     *
     * @return DirectionRate[][]
     */
    private function getMatrix(): array
    {
        return $this->directionRatesByPaymentSystemsMatrix;
    }
}
