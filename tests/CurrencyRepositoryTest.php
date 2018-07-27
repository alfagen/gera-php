<?php

namespace Gera;

use Gera\DataObject\Currency;
use Gera\Exception\UnknownCurrenciesLetterException;
use PHPUnit\Framework\TestCase;

/**
 * Class CurrencyRepositoryTest
 *
 * @package Gera
 */
class CurrencyRepositoryTest extends TestCase
{
    /**
     * @return CurrencyRepository
     *
     * @throws Exception\MissingKeyException
     * @throws \PHPUnit\Framework\Exception
     */
    public function test__construct(): CurrencyRepository
    {
        $repo = new CurrencyRepository([
           'rub' => [
               'priority' => 1,
               'iso_code' => 'RUB',
               'name' => 'Russian Ruble',
               'symbol' => '₽',
               'alternate_symbols' => ['руб.', 'р.'],
               'subunit' => 'Kopeck',
               'subunit_to_unit' => 100,
               'symbol_first' => false,
               'html_entity' => '&#x20BD;',
               'decimal_mark' => ',',
               'thousands_separator' => '.',
               'iso_numeric' => '643',
               'smallest_denomination' => 1,
               'is_crypto' => false,
               'local_id' => 1,
               'minimal_input_value' => 150,
               'minimal_output_value' => 150,
           ]
        ]);

        $this->assertInstanceOf(CurrencyRepository::class, $repo);

        return $repo;
    }

    /**
     * @depends test__construct
     *
     * @param CurrencyRepository $repo
     *
     * @throws UnknownCurrenciesLetterException
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetByCode(CurrencyRepository $repo)
    {
        $currency = $repo->getByCode('RUB');
        $this->assertInstanceOf(Currency::class, $currency);
        $this->assertEquals(1, $currency->getPriority());
        $this->expectException(UnknownCurrenciesLetterException::class);
        $repo->getByCode('USD');
    }
}
