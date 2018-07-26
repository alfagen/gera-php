<?php

declare(strict_types = 1);

namespace Gera;

use Phalcon\Db;
use Phalcon\Db\AdapterInterface;

/**
 * Class CurrencyRatesSqlRepository
 *
 * @package Gera
 */
class CurrencyRatesSqlRepository
{
    /**
     * @var AdapterInterface
     */
    private $adapter;

    /**
     * CurrencyRatesSqlRepository constructor.
     *
     * @param AdapterInterface $adapter
     */
    public function __construct(AdapterInterface $adapter)
    {
        $this->adapter = $adapter;
    }

    /**
     * Отдает плоский список всех текущих курсов "как есть".
     *
     * @return array
     */
    public function getCurrencyRates(): array
    {
        return $this->adapter->fetchAll(
            'SELECT cr.* 
            FROM currency_rates cr 
            WHERE cr.snapshot_id = (
                SELECT id
                FROM currency_rate_snapshots
                ORDER BY id DESC
                LIMIT 1
            )',
            Db::FETCH_ASSOC
        );
    }

    /**
     * Получение курсов по ID
     *
     * @param int $id
     *
     * @return array
     */
    public function getSnapshotIdByCurrencyRateId(int $id): array
    {
        return $this->adapter->fetchAll(
            'SELECT cr.*
            FROM currency_rates cr
            WHERE cr.snapshot_id = (
                SELECT cr.snapshot_id
                FROM currency_rates cr
                WHERE cr.id = :id
                ORDER BY cr.id DESC
                LIMIT 1
            )',
            Db::FETCH_ASSOC,
            [
                'id' => $id
            ]
        );
    }

    /**
     * Отдает плоский список текущих курсов  "как есть" за 8 минут.
     *
     * @param int $request_timeout_min
     *
     * @return array
     */
    public function getCurrencyRatesForInnerPS(int $request_timeout_min = 0): array
    {
        return $this->adapter->fetchAll(
            'SELECT cr.*
            FROM currency_rates cr
            WHERE cr.snapshot_id IN (
                SELECT id
                FROM currency_rate_snapshots
                WHERE created_at >= DATE_SUB(NOW(), INTERVAL :timeout MINUTE)
                ORDER BY id DESC
            )',
            Db::FETCH_ASSOC,
            [
                'timeout' => $request_timeout_min
            ]
        );
    }
}
