<?php

namespace Gera;

use Phalcon\Db\AdapterInterface;

/**
 * Class Gera
 *
 * @package Gera
 */
class Gera
{
    /**
     * @var CurrencyRatesRepository
     */
    private $currency_rate_repository;

    /**
     * @var DirectionRatesRepository
     */
    private $direction_rate_repository;

    /**
     * @var CurrencyRepository
     */
    private $currency_repository;

    /**
     * @var RateCalculationsRepository
     */
    private $rate_calculation_repository;

    /**
     * @var int
     */
    private $request_timeout = PHP_INT_MAX;

    /**
     * @var AdapterInterface
     */
    private $adapter;

    /**
     * Gera constructor.
     *
     * @param AdapterInterface $adapter
     * @param array            $currencies
     * @param int              $request_timeout
     *
     * @throws Exception\MissingKeyException
     */
    public function __construct(AdapterInterface $adapter, array $currencies, int $request_timeout = PHP_INT_MAX)
    {
        $this->adapter = $adapter;
        $this->request_timeout = $request_timeout;
        $this->currency_repository = new CurrencyRepository($currencies);
    }

    /**
     * @return CurrencyRatesRepository
     *
     * @throws Exception\MissingKeyException
     * @throws Exception\UnknownCurrenciesLetterException
     */
    public function getCurrencyRateRepository(): CurrencyRatesRepository
    {
        if (null != $this->currency_rate_repository) {
            return $this->currency_rate_repository;
        }

        return $this->currency_rate_repository = new CurrencyRatesRepository(
            new CurrencyRatesSqlRepository($this->adapter),
            $this->currency_repository,
            $this->request_timeout
        );
    }

    /**
     * @return DirectionRatesRepository
     *
     * @throws Exception\MissingKeyException
     */
    public function getDirectionRateRepository(): DirectionRatesRepository
    {
        if (null != $this->direction_rate_repository) {
            return $this->direction_rate_repository;
        }

        return $this->direction_rate_repository = new DirectionRatesRepository(
            new DirectionRatesSqlRepository($this->adapter)
        );
    }

    /**
     * @return CurrencyRepository
     */
    public function getCurrencyRepository(): CurrencyRepository
    {
        return $this->currency_repository;
    }

    /**
     * @return RateCalculationsRepository
     */
    public function getRateCalculationRepository(): RateCalculationsRepository
    {
        if (null != $this->rate_calculation_repository) {
            return $this->rate_calculation_repository;
        }

        return $this->rate_calculation_repository = new RateCalculationsRepository(
            new RateCalculationsSqlRepository($this->adapter),
            $this->currency_repository
        );
    }
}
