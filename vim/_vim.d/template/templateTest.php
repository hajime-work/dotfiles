<?php

class Test extends \PHPUnit_Framework_TestCase
{
    public function setUp()
    {

    }

    public function tearDown()
    {

    }

    public function testMain()
    {
        var_dump(Nora::Configure()->toArray());
    }
}

# vim:set ft=php.phpunit :
