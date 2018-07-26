<?php

namespace Gera;

use Phalcon\Db\Adapter\Pdo\Factory;

/**
 * Class DBConnectionFactory
 *
 * @package App\Lib
 */
class DBConnectionFactory
{
    /**
     * @param array $config
     *
     * @return \Phalcon\Db\AdapterInterface
     */
    public static function getConnection(array $config)
    {
        return Factory::load($config);
    }
}
