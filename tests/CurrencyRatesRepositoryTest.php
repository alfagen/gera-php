<?php

declare(strict_types = 1);

namespace Gera;

use Gera\DataObject\CurrencyRate;
use Gera\Exception\CurrencyRatesNotFound;
use Gera\Exception\CurrencyRatesMatrixNotFound;
use PHPUnit\Framework\TestCase;

/**
 * Class CurrencyRatesRepositoryTest
 *
 * @package Gera
 */
class CurrencyRatesRepositoryTest extends TestCase
{
    /**
     * @return CurrencyRatesRepository
     *
     * @throws Exception\MissingKeyException
     * @throws Exception\UnknownCurrenciesLetterException
     * @throws \PHPUnit\Framework\Exception
     */
    public function test__construct(): CurrencyRatesRepository
    {
        $host = getenv('MYSQL_HOST') ?: 'localhost';
        $user = getenv('MYSQL_USER') ?: 'root';
        $password = getenv('MYSQL_PASSWORD') ?: '';
        $dbName = getenv('MYSQL_DB') ?: 'test';

        $repo = new CurrencyRatesRepository(new CurrencyRatesSqlRepository(DBConnectionFactory::getConnection([
            'adapter' => 'mysql',
            'host' => $host,
            'username' => $user,
            'password' => $password,
            'dbname' => $dbName
        ])), 20);
        $this->assertInstanceOf(CurrencyRatesRepository::class, $repo);

        return $repo;
    }

    /**
     * @return \PHPUnit\Framework\MockObject\MockObject
     *
     * @throws Exception\MissingKeyException
     * @throws \PHPUnit\Framework\Exception
     */
    public function test__process()
    {
        $mock = $this->createMock(CurrencyRatesRepository::class);

        $cr_test = new CurrencyRate([
            'id' => '62382595',
            'cur_from' => 'BCH',
            'cur_to' => 'BCH',
            'rate_value' => 1,
            'snapshot_id' => '576412',
            'metadata' => '',
            'created_at' => '2018-06-22 20:05:23',
            'external_rate_id' => null,
            'mode' => '2',
            'rate_source_id' => null,
            'external_rate1_id' => null,
            'external_rate2_id' => null,
            'external_rate3_id' => null
        ]);

        $test_currencyRatesMatrixForInterval = [
            576412 => [
                    12 => [
                        12 => $cr_test
                    ]
                ]
        ];

        $test_snapshotIdsListByCurrencyRateId[62382595] = 576412;

        // проверяем, что в $mock находится экземпляр класса MyClass
        $this->assertInstanceOf(CurrencyRatesRepository::class, $mock);

        $mock->method('getCurrencyRatesMatrixForInnerPS')->willReturn($test_currencyRatesMatrixForInterval);
        $mock->method('getSnapshotIdsList')->willReturn($test_snapshotIdsListByCurrencyRateId);

        return $mock;
    }

    /**
     * @depends test__process
     *
     * @param CurrencyRatesRepository $repo
     *
     * @return int
     *
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetCurrencyRatesMatrixForInnerPS(CurrencyRatesRepository $repo): int
    {
        $result = $repo->getCurrencyRatesMatrixForInnerPS();
        $this->assertNotEmpty($result);
        $this->assertInternalType('array', $result);

        $first_element = current($result);
        $this->assertNotEmpty($first_element);
        $this->assertInternalType('array', $first_element);

        $currency_snapshot_id = key($result);
        $this->assertInternalType('int', $currency_snapshot_id);

        return $currency_snapshot_id;
    }

    /**
     * @depends test__construct
     *
     * @param CurrencyRatesRepository $repo
     *
     * @return int[]
     *
     * @throws \PHPUnit\Framework\AssertionFailedError
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetCurrencyRatesMatrix(CurrencyRatesRepository $repo): array
    {
        $result = $repo->getCurrencyRatesMatrix();
        $this->assertNotEmpty($result);
        $this->assertInternalType('array', $result);
        $from_id = key($result);
        $first_element = current($result);
        $this->assertNotEmpty($first_element);
        $this->assertInternalType('array', $first_element);
        $to_id = key($first_element);
        $first_element = current($first_element);
        $this->assertInternalType('float', $first_element);

        return [$from_id, $to_id];
    }

    /**
     * @depends test__process
     *
     * @param CurrencyRatesRepository $repo
     *
     * @return int
     *
     * @throws \PHPUnit\Framework\AssertionFailedError
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetSnapshotIdsList(CurrencyRatesRepository $repo): int
    {
        $result = $repo->getSnapshotIdsList();
        $this->assertNotEmpty($result);
        $this->assertInternalType('array', $result);

        $first_element = key($result);
        $this->assertNotEmpty($first_element);
        $this->assertInternalType('int', $first_element);

        return $first_element;
    }

    /**
     * @depends test__construct
     * @depends testGetCurrencyRatesMatrix
     *
     * @param CurrencyRatesRepository $repo
     * @param array                   $currency_direction
     *
     * @throws CurrencyRatesNotFound
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetCurrencyRate(CurrencyRatesRepository $repo, array $currency_direction)
    {
        $this->assertInternalType(
            'float',
            $repo->getCurrencyRate($currency_direction[0], $currency_direction[1])
        );
        $this->expectException(CurrencyRatesNotFound::class);
        $repo->getCurrencyRate(0, 0);
    }

    /**
     * @depends test__construct
     * @depends testGetCurrencyRatesMatrixForInnerPS
     *
     * @param CurrencyRatesRepository $repo
     * @param int                     $snapshot_id
     *
     * @throws CurrencyRatesMatrixNotFound
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetCurrencyRateMatrixBySnapshotId(CurrencyRatesRepository $repo, int $snapshot_id)
    {
        $this->expectException(CurrencyRatesMatrixNotFound::class);
        $repo->getCurrencyRateMatrixBySnapshotId(0);
    }

    /**
     * @depends test__construct
     * @depends testGetSnapshotIdsList
     *
     * @param CurrencyRatesRepository $repo
     * @param int                     $currency_id
     *
     * @throws CurrencyRatesMatrixNotFound
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetSnapshotIdByCurrencyRateId(CurrencyRatesRepository $repo, int $currency_id)
    {
        $this->expectException(CurrencyRatesMatrixNotFound::class);
        $repo->getSnapshotIdByCurrencyRateId(0);
    }
}
