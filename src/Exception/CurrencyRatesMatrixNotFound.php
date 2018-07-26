<?php

declare(strict_types = 1);

namespace Gera\Exception;

/**
 * Class CurrencyRatesMatrixNotFound
 *
 * @package Gera\Exception
 */
class CurrencyRatesMatrixNotFound extends \RuntimeException
{
    /**
     * CurrencyRatesMatrixNotFound constructor.
     *
     * @param int        $snapshot_id
     * @param int        $code
     * @param \Throwable $previous
     */
    public function __construct(int $snapshot_id, int $code = 0, \Throwable $previous = null)
    {
        parent::__construct(
            'CurrencyRate with snapshot_id = '.$snapshot_id.' not found',
            $code,
            $previous
        );
    }
}
