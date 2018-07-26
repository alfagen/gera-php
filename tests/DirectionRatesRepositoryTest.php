<?php

declare(strict_types = 1);

namespace Gera;

use Gera\DataObject\DirectionRate;
use Gera\Exception\DirectionRateNotFound;
use Gera\Exception\InnerPSMatrixNotFound;
use PHPUnit\Framework\TestCase;

/**
 * Class DirectionRatesRepositoryTest
 *
 * @package Gera
 */
class DirectionRatesRepositoryTest extends TestCase
{
    /**
     * @return DirectionRatesRepository
     *
     * @throws Exception\MissingKeyException
     * @throws \PHPUnit\Framework\Exception
     */
    public function test__construct(): DirectionRatesRepository
    {
        $host = getenv('MYSQL_HOST') ?: 'localhost';
        $user = getenv('MYSQL_USER') ?: 'root';
        $password = getenv('MYSQL_PASSWORD') ?: '';
        $dbName = getenv('MYSQL_DB') ?: 'test';

        $repo = new DirectionRatesRepository(new DirectionRatesSqlRepository(DBConnectionFactory::getConnection([
            'adapter' => 'mysql',
            'host' => $host,
            'username' => $user,
            'password' => $password,
            'dbname' => $dbName
        ])));
        $this->assertInstanceOf(DirectionRatesRepository::class, $repo);

        return $repo;
    }

    /**
     * @depends test__construct
     *
     * @param DirectionRatesRepository $repo
     *
     * @return DirectionRate
     *
     * @throws \PHPUnit\Framework\AssertionFailedError
     * @throws \PHPUnit\Framework\Exception
     * @throws \ReflectionException
     */
    public function testGetList(DirectionRatesRepository $repo): DirectionRate
    {
        $list = $this->invokeMethod($repo, 'getList');
        $this->assertInternalType('array', $list);
        $this->assertNotEmpty($list);
        $this->assertInstanceOf(
            DirectionRate::class,
            $list[0]
        );

        return $list[0];
    }

    /**
     * @depends test__construct
     * @depends testGetList
     *
     * @param DirectionRatesRepository $repo
     * @param DirectionRate            $dr
     *
     * @throws DirectionRateNotFound
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetByPaymentSystems(DirectionRatesRepository $repo, DirectionRate $dr)
    {
        $this->assertInstanceOf(
            DirectionRate::class,
            $repo->getByPaymentSystems($dr->getIncomePaymentSystemId(), $dr->getOutcomePaymentSystemId())
        );
        $this->expectException(DirectionRateNotFound::class);
        $repo->getByPaymentSystems(0, 0);
    }

    /**
     * @depends test__construct
     * @depends testGetList
     *
     * @param DirectionRatesRepository $repo
     * @param DirectionRate            $dr
     *
     * @throws DirectionRateNotFound
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetByExchangeRateId(DirectionRatesRepository $repo, DirectionRate $dr)
    {
        $this->assertInstanceOf(
            DirectionRate::class,
            $repo->getByExchangeRateId($dr->getExchangeRateId())
        );
        $this->expectException(DirectionRateNotFound::class);
        $repo->getByExchangeRateId(-1);
    }

    /**
     * @depends test__construct
     * @depends testGetList
     *
     * @param DirectionRatesRepository $repo
     * @param DirectionRate            $dr
     *
     * @throws DirectionRateNotFound
     * @throws Exception\MissingKeyException
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetById(DirectionRatesRepository $repo, DirectionRate $dr)
    {
        $this->assertInstanceOf(
            DirectionRate::class,
            $repo->getById($dr->getId())
        );
        $this->expectException(DirectionRateNotFound::class);
        $repo->getByRateId(-1);
    }

    /**
     * @depends test__construct
     * @depends testGetList
     *
     * @param DirectionRatesRepository $repo
     * @param DirectionRate            $dr
     *
     * @throws DirectionRateNotFound
     * @throws \PHPUnit\Framework\Exception
     */
    public function testgetByRateId(DirectionRatesRepository $repo, DirectionRate $dr)
    {
        $this->assertInstanceOf(
            DirectionRate::class,
            $repo->getByRateId($dr->getId())
        );
        $this->expectException(DirectionRateNotFound::class);
        $repo->getByRateId(-1);
    }

    /**
     * @depends test__construct
     * @depends testGetList
     *
     * @param DirectionRatesRepository $repo
     * @param DirectionRate            $dr
     *
     * @throws InnerPSMatrixNotFound
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetInnerPSMatrixBySnapshotId(DirectionRatesRepository $repo, DirectionRate $dr)
    {
        $this->assertInternalType(
            'array',
            $repo->getInnerPSMatrixBySnapshotId($dr->getDirectionSnapshotId())
        );
        $this->expectException(InnerPSMatrixNotFound::class);
        $repo->getInnerPSMatrixBySnapshotId(-1);
    }

    /**
     * @depends test__construct
     * @depends testGetList
     *
     * @param DirectionRatesRepository $repo
     * @param DirectionRate            $dr
     *
     * @throws DirectionRateNotFound
     * @throws InnerPSMatrixNotFound
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetInnerPSToDirectionRate(DirectionRatesRepository $repo, DirectionRate $dr)
    {
        $this->assertInternalType(
            'array',
            $repo->GetInnerPSToDirectionRate($dr->getId())
        );
        $this->expectException(DirectionRateNotFound::class);
        $repo->GetInnerPSToDirectionRate(-1);
    }

    /**
     * @depends test__construct
     *
     * @param DirectionRatesRepository $repo
     *
     * @throws \PHPUnit\Framework\AssertionFailedError
     * @throws \PHPUnit\Framework\Exception
     * @throws \ReflectionException
     */
    public function testGetMatrix(DirectionRatesRepository $repo)
    {
        $list = $this->invokeMethod($repo, 'getMatrix');
        $this->assertNotEmpty($list);
        $this->assertInternalType('array', $list);
        $first_element = current($list);
        $this->assertNotEmpty($first_element);
        $this->assertInternalType('array', $first_element);
        $this->assertInstanceOf(
            DirectionRate::class,
            current($first_element)
        );
    }

    /**
     * Call protected/private method of a class.
     *
     * @param object $object     Instantiated object that we will run method on.
     * @param string $methodName Method name to call
     * @param array  $parameters
     *
     * @return mixed Method return.
     *
     * @throws \ReflectionException
     */
    private function invokeMethod($object, string $methodName, array $parameters = [])
    {
        $reflection = new \ReflectionClass(get_class($object));
        $method = $reflection->getMethod($methodName);
        $method->setAccessible(true);

        return $method->invokeArgs($object, $parameters);
    }
}
