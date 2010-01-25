#!/usr/bin/env perl

use Nido::Handler::PSGI;

Nido::Handler::PSGI->handler(config => 'config.yaml');
