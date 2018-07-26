<?php

declare(strict_types = 1);

namespace Gera;

use Gera\DataObject\DirectionRate;
use Phalcon\Db;
use Phalcon\Db\AdapterInterface;

/**
 * Class Gera
 *
 * @package Gera
 */
class DirectionRatesSqlRepository
{
    /**
     * @var AdapterInterface
     */
    private $adapter;

    /**
     * DirectionRatesSqlRepository constructor.
     *
     * @param AdapterInterface $adapter
     */
    public function __construct(AdapterInterface $adapter)
    {
        $this->adapter = $adapter;
    }

    /**
     * Получение курса по ID
     *
     * @param int $id
     *
     * @return array
     */
    public function getById(int $id): array
    {
        $result = $this->adapter->fetchOne(
            'SELECT dr.*, drsr.direction_rate_snapshot_id
            FROM direction_rates dr
            INNER JOIN direction_rate_snapshot_to_records drsr ON dr.id = drsr.direction_rate_id
            WHERE dr.id = :id',
            Db::FETCH_ASSOC,
            [
                'id' => $id
            ]
        );

        if (!$result) {
            return [];
        }

        return $result;
    }

    /**
     * Получение всх последних курсов по направлениям
     *
     * @return array
     */
    public function getLastDirectionRates(): array
    {
        return $this->adapter->fetchAll(
            'SELECT dr.*, drsr.direction_rate_snapshot_id
            FROM direction_rates dr
            INNER JOIN direction_rate_snapshot_to_records drsr ON dr.id = drsr.direction_rate_id
            WHERE drsr.direction_rate_snapshot_id = (
                SELECT drs.id
                FROM direction_rate_snapshots drs
                ORDER BY drs.id DESC
                LIMIT 1
            )',
            Db::FETCH_ASSOC
        );
    }

    /**
     * Получение Матрицы последних курсов по направлениям
     *
     * @return DirectionRate[]
     *
     * @throws Exception\MissingAttrException
     */
    public function getLastDirectionRatesMatrix(): array
    {
        return Utils::flatArrayToMatrix($this->getLastDirectionRates(), 'ps_from_id', 'ps_to_id');
    }
}
