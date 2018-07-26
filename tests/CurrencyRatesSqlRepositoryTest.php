<?php

declare(strict_types = 1);

namespace Gera;

use PHPUnit\Framework\TestCase;

require_once dirname(dirname(__DIR__)).'/core/cms.php';

/**
 * Class CurrencyRatesSqlRepositoryTest
 *
 * @package Gera
 */
class CurrencyRatesSqlRepositoryTest extends TestCase
{
    /**
     * @return CurrencyRatesSqlRepository
     *
     * @throws \PHPUnit\Framework\Exception
     */
    public function test__construct(): CurrencyRatesSqlRepository
    {
        $repo = \cmsCore::getInstance()->getCurrencyRatesSqlRepository();
        $this->assertInstanceOf(CurrencyRatesSqlRepository::class, $repo);

        return $repo;
    }

    /**
     * @depends test__construct
     *
     * @param CurrencyRatesSqlRepository $repo
     *
     * @throws \PHPUnit\Framework\AssertionFailedError
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetCurrencyRates(CurrencyRatesSqlRepository $repo)
    {
        $result = $repo->getCurrencyRates();
        $this->assertNotEmpty($result);
        $this->assertInternalType('array', $result[0]);
    }
}
