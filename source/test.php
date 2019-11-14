<?php

require "vendor/autoload.php";

use Pheanstalk\Pheanstalk;

$ph = Pheanstalk::create('127.0.0.1');

print_r($ph->stats());//查看目前pheanStalkd状态信息
