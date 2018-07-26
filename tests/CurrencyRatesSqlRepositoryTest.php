<?php

declare(strict_types = 1);

namespace Gera;

use PHPUnit\Framework\TestCase;

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
        $host = getenv('MYSQL_HOST') ?: 'localhost';
        $user = getenv('MYSQL_USER') ?: 'root';
        $password = getenv('MYSQL_PASSWORD') ?: '';
        $dbName = getenv('MYSQL_DB') ?: 'test';

        $repo = new CurrencyRatesSqlRepository(DBConnectionFactory::getConnection([
            'adapter' => 'mysql',
            'host' => $host,
            'username' => $user,
            'password' => $password,
            'dbname' => $dbName
        ]));
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
