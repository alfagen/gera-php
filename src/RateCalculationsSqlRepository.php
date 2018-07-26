<?php

declare(strict_types = 1);

namespace Gera;

use Phalcon\Db;
use Phalcon\Db\AdapterInterface;

/**
 * Class RateCalculationsSqlRepository
 *
 * @package Gera
 */
class RateCalculationsSqlRepository
{
    /**
     * @var AdapterInterface
     */
    private $adapter;

    /**
     * RateCalculationsSqlRepository constructor.
     *
     * @param AdapterInterface $adapter
     */
    public function __construct(AdapterInterface $adapter)
    {
        $this->adapter = $adapter;
    }

    /**
     * Получение расчета по ID
     *
     * @param int $id
     *
     * @return array
     */
    public function getById(int $id): array
    {
        return $this->adapter->fetchOne(
            'SELECT *
            FROM `rate_calculations`
            WHERE id = :id
            ORDER BY id DESC
            LIMIT 1',
            Db::FETCH_ASSOC,
            [
                'id' => $id
            ]
        );
    }
}
