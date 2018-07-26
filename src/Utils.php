<?php

declare(strict_types = 1);

namespace Gera;

use Gera\Exception\MissingAttrException;
use Gera\Exception\MissingClass;
use Gera\Exception\MissingMethodException;
use Gera\Exception\NoRateMultiplicator;

/**
 * Class Utils
 *
 * @package Gera
 */
class Utils
{
    /**
     * Возвращает матрицу (ассоциативную массив ассоциативных массивов).
     *
     * Ключ массива - значение из записи с ключом attr1 (для массива верхнего уровня) и
     * значение записи с ключом attr2 для массива нижнего уровня. Значение элемента - сама запись.
     *
     * @param array  $data  плоский массив
     * @param string $attr1 название атриба1
     * @param string $attr2 название атриба1
     *
     * @return array
     *
     * @throws MissingAttrException в масисве нет запрашиваемого ключа
     */
    public static function flatArrayToMatrix(array $data, string $attr1, string $attr2): array
    {
        if (!count($data)) {
            return [];
        }

        $row = current($data);

        if (!array_key_exists($attr1, $row)) {
            throw new MissingAttrException('Attribute "'.$attr1.'"" not contained in the array');
        }

        if (!array_key_exists($attr2, $row)) {
            throw new MissingAttrException('Attribute "'.$attr2.'"" not contained in the array');
        }

        unset($row);
        $result = [];

        foreach ($data as $v) {
            $attr = $v[$attr1];

            if (!isset($result[$attr])) {
                $result[$attr] = [];
            }

            $result[$attr][$v[$attr2]] = $v;
        }

        return $result;
    }

    /**
     * Возвращает матрицу (ассоциативный массив ассоциативных массивов).
     *
     * Ключ массива - значение результат метода $method1 (для массива верхнего уровня) и
     * значение метода $method2 для массива нижнего уровня. Значение элемента - сама запись.
     *
     * @param object[] $data    плоский массив
     * @param string   $method1 название первого метода
     * @param string   $method2 название второго метода
     *
     * @return object[][]
     *
     * @throws MissingMethodException в объекте нет запрашиваемого ключа
     */
    public static function flatArrayOfObjectsToMatrix(array $data, string $method1, string $method2): array
    {
        if (!count($data)) {
            return [];
        }

        /**
         * @var object $row
         */
        $row = current($data);

        if (!method_exists($row, $method1)) {
            throw new MissingMethodException('Method "'.$method1.'"" not contained in "'.get_class($row).'" object');
        }

        if (!method_exists($row, $method2)) {
            throw new MissingMethodException('Method "'.$method2.'"" not contained in "'.get_class($row).'" object');
        }

        unset($row);
        $result = [];

        foreach ($data as $v) {
            $attr = $v->$method1();

            if (!isset($result[$attr])) {
                $result[$attr] = [];
            }

            $result[$attr][$v->$method2()] = $v;
        }

        return $result;
    }

    /**
     * Функция для мапинга ассоциативных массиов в классом
     *
     * @param string   $className имя класса для маппинга
     * @param array<T> $data      массив данных
     *
     * @return array<T>
     *
     * @throws MissingClass
     */
    public static function dataMapping(string $className, array $data): array
    {
        if (!class_exists($className)) {
            throw new MissingClass('Class '.$className.' not exist');
        }

        foreach ($data as $k => $v) {
            $data[$k] = new $className($v);
        }

        return $data;
    }

    /**
     * Функция для расчета сумм на входе и выходе
     * Если `rate_multiplicator>=1`, то
     * `return { in: 1, out: rate_multiplicator }`
     * иначе
     * `return { in: 1.0 / rate_multiplicator, out: 1 }`
     *
     * @param float $rate_multiplicator
     *
     * @return array<T>
     *
     * @throws NoRateMultiplicator
     */
    public static function get_rate_amount(float $rate_multiplicator): array
    {
        if (0 == $rate_multiplicator) {
            throw new NoRateMultiplicator('Курсовой мультипликатор не может быть равен нулю');
        }

        return ($rate_multiplicator >= 1) ? ['in' => 1, 'out' => $rate_multiplicator] : ['in' => 1.0 / $rate_multiplicator, 'out' => 1];
    }
}
