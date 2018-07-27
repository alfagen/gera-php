<?php

namespace Gera\DataObject;

use Gera\Exception\MissingKeyException;

/**
 * Class Currency
 *
 * @package Gera\DataObject
 */
class Currency
{
    /**
     * @var int
     */
    private $priority;

    /**
     * @var string
     */
    private $iso_code;

    /**
     * @var string
     */
    private $name;

    /**
     * @var string
     */
    private $symbol;

    /**
     * @var string[]
     */
    private $alternate_symbols = [];

    /**
     * @var string
     */
    private $subunit;

    /**
     * @var int
     */
    private $subunit_to_unit;

    /**
     * @var bool
     */
    private $symbol_first = false;

    /**
     * @var string
     */
    private $html_entity;

    /**
     * @var string
     */
    private $decimal_mark;

    /**
     * @var string
     */
    private $thousands_separator;

    /**
     * @var string
     */
    private $iso_numeric;

    /**
     * @var int
     */
    private $smallest_denomination;

    /**
     * @var bool
     */
    private $is_crypto = false;

    /**
     * @var int
     */
    private $local_id;

    /**
     * @var float
     */
    private $minimal_input_value;

    /**
     * @var float
     */
    private $minimal_output_value;

    public function __construct(array $data)
    {
        if (!isset($data['priority'])) {
            throw new MissingKeyException('priority');
        }

        if (!isset($data['iso_code'])) {
            throw new MissingKeyException('iso_code');
        }

        if (!isset($data['name'])) {
            throw new MissingKeyException('name');
        }

        if (!isset($data['subunit_to_unit'])) {
            throw new MissingKeyException('subunit_to_unit');
        }

        if (!isset($data['html_entity'])) {
            throw new MissingKeyException('html_entity');
        }

        if (!isset($data['decimal_mark'])) {
            throw new MissingKeyException('decimal_mark');
        }

        if (!isset($data['thousands_separator'])) {
            throw new MissingKeyException('thousands_separator');
        }

        if (!isset($data['iso_numeric'])) {
            throw new MissingKeyException('iso_numeric');
        }

        if (!isset($data['smallest_denomination'])) {
            throw new MissingKeyException('smallest_denomination');
        }

        if (!isset($data['is_crypto'])) {
            throw new MissingKeyException('is_crypto');
        }

        if (!isset($data['local_id'])) {
            throw new MissingKeyException('local_id');
        }

        if (!isset($data['minimal_input_value'])) {
            throw new MissingKeyException('minimal_input_value');
        }

        if (!isset($data['minimal_output_value'])) {
            throw new MissingKeyException('minimal_output_value');
        }

        $this->priority = (int) $data['priority'];
        $this->iso_code = $data['iso_code'];
        $this->name = $data['name'];
        $this->symbol = $data['symbol'] ?? '';
        $this->alternate_symbols = $data['alternate_symbols'] ?? [];
        $this->subunit = $data['subunit'] ?? '';
        $this->subunit_to_unit = (int) $data['subunit_to_unit'];
        $this->symbol_first = (bool) ($data['symbol_first'] ?? false);
        $this->html_entity = $data['html_entity'];
        $this->decimal_mark = $data['decimal_mark'];
        $this->thousands_separator = $data['thousands_separator'];
        $this->iso_numeric = $data['iso_numeric'];
        $this->smallest_denomination = (int) $data['smallest_denomination'];
        $this->is_crypto = (bool) ($data['is_crypto'] ?? false);
        $this->local_id = (int) $data['local_id'];
        $this->minimal_input_value = (float) $data['minimal_input_value'];
        $this->minimal_output_value = (float) $data['minimal_output_value'];
    }

    /**
     * @return int
     */
    public function getPriority(): int
    {
        return $this->priority;
    }

    /**
     * @param int $priority
     */
    public function setPriority(int $priority)
    {
        $this->priority = $priority;
    }

    /**
     * @return string
     */
    public function getIsoCode(): string
    {
        return $this->iso_code;
    }

    /**
     * @param string $iso_code
     */
    public function setIsoCode(string $iso_code)
    {
        $this->iso_code = $iso_code;
    }

    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName(string $name)
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getSymbol(): string
    {
        return $this->symbol;
    }

    /**
     * @param string $symbol
     */
    public function setSymbol(string $symbol)
    {
        $this->symbol = $symbol;
    }

    /**
     * @return string[]
     */
    public function getAlternateSymbols(): array
    {
        return $this->alternate_symbols;
    }

    /**
     * @param string[] $alternate_symbols
     */
    public function setAlternateSymbols(array $alternate_symbols)
    {
        $this->alternate_symbols = $alternate_symbols;
    }

    /**
     * @return string
     */
    public function getSubunit(): string
    {
        return $this->subunit;
    }

    /**
     * @param string $subunit
     */
    public function setSubunit(string $subunit)
    {
        $this->subunit = $subunit;
    }

    /**
     * @return int
     */
    public function getSubunitToUnit(): int
    {
        return $this->subunit_to_unit;
    }

    /**
     * @param int $subunit_to_unit
     */
    public function setSubunitToUnit(int $subunit_to_unit)
    {
        $this->subunit_to_unit = $subunit_to_unit;
    }

    /**
     * @return bool
     */
    public function isSymbolFirst(): bool
    {
        return $this->symbol_first;
    }

    /**
     * @param bool $symbol_first
     */
    public function setSymbolFirst(bool $symbol_first)
    {
        $this->symbol_first = $symbol_first;
    }

    /**
     * @return string
     */
    public function getHtmlEntity(): string
    {
        return $this->html_entity;
    }

    /**
     * @param string $html_entity
     */
    public function setHtmlEntity(string $html_entity)
    {
        $this->html_entity = $html_entity;
    }

    /**
     * @return string
     */
    public function getDecimalMark(): string
    {
        return $this->decimal_mark;
    }

    /**
     * @param string $decimal_mark
     */
    public function setDecimalMark(string $decimal_mark)
    {
        $this->decimal_mark = $decimal_mark;
    }

    /**
     * @return string
     */
    public function getThousandsSeparator(): string
    {
        return $this->thousands_separator;
    }

    /**
     * @param string $thousands_separator
     */
    public function setThousandsSeparator(string $thousands_separator)
    {
        $this->thousands_separator = $thousands_separator;
    }

    /**
     * @return string
     */
    public function getIsoNumeric(): string
    {
        return $this->iso_numeric;
    }

    /**
     * @param string $iso_numeric
     */
    public function setIsoNumeric(string $iso_numeric)
    {
        $this->iso_numeric = $iso_numeric;
    }

    /**
     * @return int
     */
    public function getSmallestDenomination(): int
    {
        return $this->smallest_denomination;
    }

    /**
     * @param int $smallest_denomination
     */
    public function setSmallestDenomination(int $smallest_denomination)
    {
        $this->smallest_denomination = $smallest_denomination;
    }

    /**
     * @return bool
     */
    public function isCrypto(): bool
    {
        return $this->is_crypto;
    }

    /**
     * @param bool $is_crypto
     */
    public function setIsCrypto(bool $is_crypto)
    {
        $this->is_crypto = $is_crypto;
    }

    /**
     * @return int
     */
    public function getLocalId(): int
    {
        return $this->local_id;
    }

    /**
     * @param int $local_id
     */
    public function setLocalId(int $local_id)
    {
        $this->local_id = $local_id;
    }

    /**
     * @return float
     */
    public function getMinimalInputValue(): float
    {
        return $this->minimal_input_value;
    }

    /**
     * @param float $minimal_input_value
     */
    public function setMinimalInputValue(float $minimal_input_value)
    {
        $this->minimal_input_value = $minimal_input_value;
    }

    /**
     * @return float
     */
    public function getMinimalOutputValue(): float
    {
        return $this->minimal_output_value;
    }

    /**
     * @param float $minimal_output_value
     */
    public function setMinimalOutputValue(float $minimal_output_value)
    {
        $this->minimal_output_value = $minimal_output_value;
    }
}
