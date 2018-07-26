<?php

declare(strict_types = 1);

namespace Gera;

use Gera\Exception\MissingAttrException;
use Gera\Exception\NoRateMultiplicator;
use PHPUnit\Framework\TestCase;

/**
 * Class UtilsTest
 *
 * @package Gera
 */
class UtilsTest extends TestCase
{
    /**
     * @return array
     * @throws \PHPUnit\Framework\AssertionFailedError
     */
    public function testArray(): array
    {
        $input_array = [['id1' => 1, 'id2' => 2, 'value' => 3], ['id1' => 2, 'id2' => 1, 'value' => 4]];
        $this->assertNotEmpty($input_array);

        return $input_array;
    }

    /**
     * @depends testArray
     *
     * @param array $input_array
     *
     * @throws MissingAttrException
     * @throws \PHPUnit\Framework\ExpectationFailedException
     * @throws \SebastianBergmann\RecursionContext\InvalidArgumentException
     */
    public function testFlatArrayToMatrix(array $input_array)
    {
        $this->assertSame(
            Utils::flatArrayToMatrix($input_array, 'id1', 'id2'),
            [
                1 => [2 => ['id1' => 1, 'id2' => 2, 'value' => 3]],
                2 => [1 => ['id1' => 2, 'id2' => 1, 'value' => 4]]
            ]
        );
    }

    /**
     * @depends testArray
     *
     * @param array $input_array
     *
     * @throws MissingAttrException
     * @throws \PHPUnit\Framework\Exception
     */
    public function testFlatArrayToMatrixMissingAttr(array $input_array)
    {
        $this->expectException(MissingAttrException::class);
        Utils::flatArrayToMatrix($input_array, 'id1', 'id3');
    }

    /**
     * @throws NoRateMultiplicator
     * @throws \PHPUnit\Framework\Exception
     */
    public function testGet_rate_amount()
    {
        $this->expectException(NoRateMultiplicator::class);
        Utils::get_rate_amount(0);
    }
}
