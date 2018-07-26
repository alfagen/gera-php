<?php

declare(strict_types = 1);

namespace Gera\Exception;

/**
 * Class CurrencyRatesNotFound
 *
 * @package Gera\Exception
 */
class CurrencyRatesNotFound extends \RuntimeException
{
    /**
     * CurrencyRatesNotFound constructor.
     *
     * @param int        $from
     * @param int        $to
     * @param int        $code
     * @param \Throwable $previous
     */
    public function __construct(int $from, int $to, int $code = 0, \Throwable $previous = null)
    {
        parent::__construct(
            'CurrencyRate with from_id = '.$from.' and to_id = '.$to.' not found',
            $code,
            $previous
        );
    }
}
