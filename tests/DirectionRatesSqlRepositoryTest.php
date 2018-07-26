<?php

declare(strict_types = 1);

namespace Gera;

use PHPUnit\Framework\TestCase;

require_once dirname(dirname(__DIR__)).'/core/cms.php';

/**
 * Class DirectionRatesSqlRepositoryTest
 *
 * @package Gera
 */
class DirectionRatesSqlRepositoryTest extends TestCase
{
    /**
     * @return DirectionRatesSqlRepository
     * @throws \PHPUnit\Framework\Exception
     */
    public function test__construct(): DirectionRatesSqlRepository
    {
        $repo = \cmsCore::getInstance()->getDirectionRateSqlRepository();
        $this->assertInstanceOf(DirectionRatesSqlRepository::class, $repo);

        return $repo;
    }

    /**
     * @depends test__construct
     *
     * @param DirectionRatesSqlRepository $repo
     *
     * @throws \PHPUnit\Framework\AssertionFailedError
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetById(DirectionRatesSqlRepository $repo)
    {
        $result = $repo->getById(574587983);
        $this->assertInternalType('array', $result);
        $this->assertEmpty($repo->getById(-1));
    }

    /**
     * @depends test__construct
     *
     * @param DirectionRatesSqlRepository $repo
     *
     * @throws \PHPUnit\Framework\AssertionFailedError
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetLastDirectionRates(DirectionRatesSqlRepository $repo)
    {
        $result = $repo->getLastDirectionRates();
        $this->assertNotEmpty($result);
        $this->assertInternalType('array', $result[0]);
    }

    /**
     * @depends test__construct
     *
     * @param DirectionRatesSqlRepository $repo
     *
     * @throws Exception\MissingAttrException
     * @throws \PHPUnit\Framework\AssertionFailedError
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGetLastDirectionRatesMatrix(DirectionRatesSqlRepository $repo)
    {
        $result = $repo->getLastDirectionRatesMatrix();
        $this->assertNotEmpty($result);
        $first_element = current($result);
        $this->assertInternalType('array', $first_element);
        $this->assertNotEmpty($first_element);
        $this->assertInternalType('array', current($first_element));
    }
}
