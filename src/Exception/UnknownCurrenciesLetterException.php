<?php

declare(strict_types = 1);

namespace Gera\Exception;

/**
 * Class UnknownCurrenciesLetterException
 *
 * @package Gera\Exception
 */
class UnknownCurrenciesLetterException extends \RuntimeException
{
    /**
     * UnknownCurrenciesLetterException constructor.
     *
     * @param string     $letter
     * @param int        $code
     * @param \Throwable $previous
     */
    public function __construct(string $letter, int $code = null, \Throwable $previous = null)
    {
        parent::__construct('Unknown letter "'.$letter.'"', $code, $previous);
    }
}
