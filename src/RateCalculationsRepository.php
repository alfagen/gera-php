<?php

declare(strict_types = 1);

namespace Gera;

use Gera\DataObject\RateCalculation;
use Gera\Exception\RateCalculationNotFound;

/**
 * Class RateCalculationsRepository
 *
 * @package Gera
 */
class RateCalculationsRepository
{
    /**
     * @var RateCalculationsSqlRepository
     */
    private $repository;

    /**
     * @var CurrencyRepository
     */
    private $currency_repository;

    /**
     * RateCalculationsRepository constructor.
     *
     * @param RateCalculationsSqlRepository $repository
     * @param CurrencyRepository            $currencyRepository
     */
    public function __construct(RateCalculationsSqlRepository $repository, CurrencyRepository $currencyRepository)
    {
        $this->repository = $repository;
        $this->currency_repository = $currencyRepository;
    }

    /**
     * Возвращает матрицу текущих курсов по rate_calculation_id
     *
     * @param int $rate_calculation_id
     *
     * @return RateCalculation
     *
     * @throws Exception\MissingKeyException
     * @throws Exception\UnknownCurrenciesLetterException
     * @throws RateCalculationNotFound
     */
    public function getRateCalculationByRateCalculationId(int $rate_calculation_id): RateCalculation
    {
        $result = $this->repository->getById($rate_calculation_id);

        if (!$result) {
            throw new RateCalculationNotFound($rate_calculation_id);
        }

        $result['income_amount_currency'] = $this->currency_repository->getByCode($result['income_amount_currency']);
        $result['outcome_amount_currency'] = $this->currency_repository->getByCode($result['outcome_amount_currency']);

        return new RateCalculation($result);
    }
}
