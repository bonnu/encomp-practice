#!/usr/bin/env perl

use DemoFW::Handler::PSGI;

DemoFW::Handler::PSGI->handler(
    file   => __FILE__,
    config => 'config.yaml',
);
