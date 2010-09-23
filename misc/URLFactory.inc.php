<?php
/**
* Rosetta Blog
*   Copyright © 2010 Theodore R. Smith <theodore@phpexperts.pro>
*
* The following code is licensed under a modified BSD License.
* All of the terms and conditions of the BSD License apply with one
* exception:
*
* 1. Every one who has not been a registered student of the "PHPExperts
*    From Beginner To Pro" course (http://www.phpexperts.pro/) is forbidden
*    from modifing this code or using in an another project, either as a
*    deritvative work or stand-alone.
*
* BSD License: http://www.opensource.org/licenses/bsd-license.php
**/

class URLFactory
{
    private function __construct() { }

    private static function make()
    {
        $config = SimpleConfig::getInstance();
        
        if (isset($config['url_style']))
        {
            $className = $config['url_style'] . 'URL';
            if (class_exists($className))
            {
                return new $className;
            }
        }
        
        return new RosettaURL;
    }

    public static function makePrettyURL($args)
    {
        $url = self::make();

        return $url->makePrettyURL($args);
    }
}

class RosettaURL
{
    public function makePrettyURL($params)
    {
        if (isset($params['view']) && $params['view'] == 'article')
        {
            $url = 'article/' . $params['id'];
            unset($params['view']); unset($params['id']);

            if (!empty($params))
            {
                // Append the rest of the array:
                $url .= '?' . http_build_query($params);
            }
        }

        return $url;
    }
}

class DrupalURL
{
    public function makePrettyURL($params)
    {
        if (isset($params['view']) && $params['view'] == 'article')
        {
            $url = 'node/' . $params['id'];
            unset($params['view']); unset($params['id']);

            if (!empty($params))
            {
                // Append the rest of the array:
                $url .= '?' . http_build_query($params);
            }
        }

        return $url;
    }
}

