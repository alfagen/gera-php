<?php

namespace Gera;

use Gera\DataObject\Currency;
use Gera\Exception\UnknownCurrenciesLetterException;

/**
 * Class CurrencyRepository
 *
 * @package Gera
 */
class CurrencyRepository
{
    /**
     * @var Currency[]
     */
    private $currencies = [];

    /**
     * CurrencyRepository constructor.
     *
     * @param array $currencies
     *
     * @throws Exception\MissingKeyException
     */
    public function __construct(array $currencies)
    {
        foreach ($currencies as $k => $v) {
            $this->currencies[$k] = new Currency($v);
        }
    }

    /**
     * @param string $code
     *
     * @return Currency
     *
     * @throws UnknownCurrenciesLetterException
     */
    public function getByCode(string $code): Currency
    {
        foreach ($this->currencies as $v) {
            if ($code == $v->getIsoCode()) {
                return $v;
            }
        }

        throw new UnknownCurrenciesLetterException($code);
    }
}
