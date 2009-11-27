#!/usr/bin/env perl

use DemoFW::Handler::PSGI;

DemoFW::Handler::PSGI->handler(config => 'config.yaml');
