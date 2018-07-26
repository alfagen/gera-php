<?php

declare(strict_types = 1);

namespace Gera\Exception;

/**
 * Class RateCalculationNotFound
 *
 * @package Gera\Exception
 */
class RateCalculationNotFound extends \RuntimeException
{
    /**
     * CurrencyRatesNotFound constructor.
     *
     * @param int        $rate_calculation_id
     * @param int        $code
     * @param \Throwable $previous
     */
    public function __construct(int $rate_calculation_id, int $code = 0, \Throwable $previous = null)
    {
        parent::__construct(
            'RateCalculation with id = '.$rate_calculation_id.' not found',
            $code,
            $previous
        );
    }
}
