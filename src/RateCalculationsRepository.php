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
     * @see https://github.com/alfagen/kassa-admin/wiki#currencies
     */
    const CURRENCIES = [
        'RUB' => 1,
        'USD' => 2,
        'BTC' => 3,
        'LTC' => 4,
        'ETH' => 5,
        'DSH' => 6,
        'KZT' => 8,
        'XRP' => 9,
        'ETC' => 10,
        'XMR' => 11,
        'BCH' => 12
    ];

    /**
     * @var RateCalculationsSqlRepository
     */
    private $repository;

    /**
     * RateCalculationsRepository constructor.
     *
     * @param RateCalculationsSqlRepository $repository
     */
    public function __construct(RateCalculationsSqlRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * Возвращает матрицу текущих курсов по rate_calculation_id
     *
     * @param int $rate_calculation_id
     *
     * @return RateCalculation
     *
     * @throws Exception\MissingKeyException
     * @throws RateCalculationNotFound
     */
    public function getRateCalculationByRateCalculationId(int $rate_calculation_id): RateCalculation
    {
        $result = $this->repository->getById($rate_calculation_id);

        if (!$result) {
            throw new RateCalculationNotFound($rate_calculation_id);
        }

        return new RateCalculation($result);
    }
}
