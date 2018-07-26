<?php

declare(strict_types = 1);

namespace Gera\DataObject;

use Gera\Exception\MissingKeyException;

/**
 * Class DirectionRate
 *
 * @package Gera\DataObject
 */
class DirectionRate
{
    /**
     * @var int
     */
    protected $id;

    /**
     * @var int
     */
    protected $ps_from_id;

    /**
     * @var int
     */
    protected $ps_to_id;

    /**
     * @var float
     */
    protected $rate_value;

    /**
     * @var float
     */
    protected $base_rate_value;

    /**
     * @var float
     */
    protected $rate_percent;

    /**
     * @var int
     */
    protected $exchange_rate_id;

    /**
     * @var int
     */
    protected $direction_rate_snapshot_id;

    /**
     * @var int
     */
    protected $currency_rate_id;

    /**
     * @var \DateTimeImmutable
     */
    protected $created_at;

    /**
     * DirectionRate constructor.
     *
     * @param array $data
     *
     * @throws MissingKeyException
     */
    public function __construct(array $data)
    {
        if (!isset($data['id'])) {
            throw new MissingKeyException('id');
        }

        if (!isset($data['ps_from_id'])) {
            throw new MissingKeyException('ps_from_id');
        }

        if (!isset($data['ps_to_id'])) {
            throw new MissingKeyException('ps_to_id');
        }

        if (!isset($data['rate_value'])) {
            throw new MissingKeyException('rate_value');
        }

        if (!isset($data['base_rate_value'])) {
            throw new MissingKeyException('base_rate_value');
        }

        if (!isset($data['rate_percent'])) {
            throw new MissingKeyException('rate_percent');
        }

        if (!isset($data['exchange_rate_id'])) {
            throw new MissingKeyException('exchange_rate_id');
        }

        if (!isset($data['direction_rate_snapshot_id'])) {
            throw new MissingKeyException('direction_rate_snapshot_id');
        }

        if (!isset($data['currency_rate_id'])) {
            throw new MissingKeyException('currency_rate_id');
        }

        if (!isset($data['created_at'])) {
            throw new MissingKeyException('created_at');
        }

        $this->id = (int) $data['id'];
        $this->ps_from_id = (int) $data['ps_from_id'];
        $this->ps_to_id = (int) $data['ps_to_id'];
        $this->rate_value = (float) $data['rate_value'];
        $this->base_rate_value = (float) $data['base_rate_value'];
        $this->rate_percent = (float) $data['rate_percent'];
        $this->exchange_rate_id = (int) $data['exchange_rate_id'];
        $this->direction_rate_snapshot_id = (int) $data['direction_rate_snapshot_id'];
        $this->currency_rate_id = (int) $data['currency_rate_id'];
        $this->created_at = \DateTimeImmutable::createFromFormat('Y-m-d H:i:s', $data['created_at']);
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return int
     */
    public function getIncomePaymentSystemId(): int
    {
        return $this->ps_from_id;
    }

    /**
     * @return int
     */
    public function getOutcomePaymentSystemId(): int
    {
        return $this->ps_to_id;
    }

    /**
     * курс с комиссией
     * @return float
     */
    public function getRateValue(): float
    {
        return $this->rate_value;
    }

    /**
     * базовый курс
     * @return float
     */
    public function getBaseRateValue(): float
    {
        return $this->base_rate_value;
    }

    /**
     * комиссия системы в процентах
     * @return float
     */
    public function getRatePercent(): float
    {
        return $this->rate_percent;
    }

    /**
     * @return int
     */
    public function getExchangeRateId(): int
    {
        return $this->exchange_rate_id;
    }

    /**
     * @return int
     */
    public function getCurrencyRateId(): int
    {
        return $this->currency_rate_id;
    }

    /**
     * @return int
     */
    public function getDirectionSnapshotId(): int
    {
        return $this->direction_rate_snapshot_id;
    }

    /**
     * @return \DateTimeImmutable
     */
    public function getCreatedAt(): \DateTimeImmutable
    {
        return $this->created_at;
    }

    /**
     * @return bool
     *
     * @throws \Exception
     */
    public function isLate(): bool
    {
        return new \DateTime() < $this->created_at->add(
            new \DateInterval('PT'.REQUEST_COURSE_TIMEOUT_MIN.'M')
        );
    }
}
