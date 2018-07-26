<?php

declare(strict_types = 1);

namespace Gera\DataObject;

use Gera\Exception\MissingKeyException;

/**
 * Class RateCalculation
 *
 * @package Gera\DataObject
 */
class RateCalculation
{
    /**
     * @see https://github.com/alfagen/kassa-admin/wiki#currencies
     */
    const CURRENCIES = [
        'RUB' => 1,
        'USD' => 2,
        'BTC' => 3,
        'LTC' => 4,
        'ETH' => 5,
        'DSH' => 6,
        'KZT' => 8,
        'XRP' => 9,
        'ETC' => 10,
        'XMR' => 11,
        'BCH' => 12
    ];

    /**
     * @var int
     */
    protected $id;

    /**
     * @var float
     */
    protected $income_amount_cents;

    /**
     * @var int
     */
    protected $income_amount_currency;

    /**
     * @var float
     */
    protected $outcome_amount_cents;

    /**
     * @var int
     */
    protected $outcome_amount_currency;

    /**
     * @var int
     */
    protected $direction_rate_id;

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

        if (!isset($data['income_amount_cents'])) {
            throw new MissingKeyException('income_amount_cents');
        }

        if (!isset($data['income_amount_currency'])) {
            throw new MissingKeyException('income_amount_currency');
        }

        if (!isset($data['outcome_amount_cents'])) {
            throw new MissingKeyException('outcome_amount_cents');
        }

        if (!isset($data['outcome_amount_currency'])) {
            throw new MissingKeyException('outcome_amount_currency');
        }

        if (!isset($data['direction_rate_id'])) {
            throw new MissingKeyException('direction_rate_id');
        }

        if (!isset($data['created_at'])) {
            throw new MissingKeyException('created_at');
        }

        $this->id = (int) $data['id'];
        $this->income_amount_currency = $data['income_amount_currency'];
        $this->outcome_amount_currency = $data['outcome_amount_currency'];
        $this->income_amount_cents = (float) $data['income_amount_cents'];
        $this->outcome_amount_cents = (float) $data['outcome_amount_cents'];
        $this->direction_rate_id = (int) $data['direction_rate_id'];
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
    public function getIncomeAmountCurrency(): int
    {
        return self::CURRENCIES[$this->income_amount_currency];
    }

    /**
     * @return int
     */
    public function getOutcomeAmountCurrency(): int
    {
        return self::CURRENCIES[$this->outcome_amount_currency];
    }

    /**
     * @return float
     */
    public function getOutcomeAmountCents(): float
    {
        return $this->outcome_amount_cents;
    }

    /**
     * @return float
     */
    public function getIncomeAmountCents(): float
    {
        return $this->income_amount_cents;
    }

    /**
     * @return int
     */
    public function getDirectionRateId(): int
    {
        return $this->direction_rate_id;
    }

    /**
     * @return \DateTimeImmutable
     */
    public function getCreatedAt(): \DateTimeImmutable
    {
        return $this->created_at;
    }
}
