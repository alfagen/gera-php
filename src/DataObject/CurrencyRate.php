<?php

declare(strict_types = 1);

namespace Gera\DataObject;

use Gera\Exception\MissingKeyException;

/**
 * Class CurrencyRate
 *
 * @package Gera\DataObject
 */
class CurrencyRate
{
    /**
     * @var int
     */
    protected $id;

    /**
     * @var int
     */
    protected $typecy_from;

    /**
     * @var int
     */
    protected $typecy_to;

    /**
     * @var float
     */
    protected $rate_value;

    /**
     * @var int
     */
    protected $snapshot_id;

    /**
     * @var \DateTimeImmutable
     */
    protected $created_at;

    /**
     * CurrencyRate constructor.
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

        if (!isset($data['cur_from'])) {
            throw new MissingKeyException('typecy_from');
        }

        if (!isset($data['cur_to'])) {
            throw new MissingKeyException('typecy_to');
        }

        if (!isset($data['rate_value'])) {
            throw new MissingKeyException('rate_value');
        }

        if (!isset($data['snapshot_id'])) {
            throw new MissingKeyException('snapshot_id');
        }

        if (!isset($data['created_at'])) {
            throw new MissingKeyException('created_at');
        }

        $this->id = (int) $data['id'];
        $this->typecy_from = (int) $data['cur_from'];
        $this->typecy_to = (int) $data['cur_to'];
        $this->rate_value = (float) $data['rate_value'];
        $this->snapshot_id = (int) $data['snapshot_id'];
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
    public function getIncomeCurrencyId(): int
    {
        return $this->typecy_from;
    }

    /**
     * @return int
     */
    public function getOutcomeCurrencyId(): int
    {
        return $this->typecy_to;
    }

    /**
     * курс
     *
     * @return float
     */
    public function getRateValue(): float
    {
        return $this->rate_value;
    }

    /**
     * @return int
     */
    public function getSnapshotId(): int
    {
        return $this->snapshot_id;
    }

    /**
     * @return \DateTimeImmutable
     */
    public function getCreatedAt(): \DateTimeImmutable
    {
        return $this->created_at;
    }
}
