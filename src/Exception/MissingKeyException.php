<?php

declare(strict_types = 1);

namespace Gera\Exception;

/**
 * Class MissingKeyException
 *
 * @package Gera\Exception
 */
class MissingKeyException extends \RuntimeException
{
    /**
     * MissingKeyException constructor.
     *
     * @param string     $key
     * @param int        $code
     * @param \Throwable $previous
     */
    public function __construct(string $key, int $code = 0, \Throwable $previous = null)
    {
        parent::__construct('Array not contain "'.$key.'"" key', $code, $previous);
    }
}
