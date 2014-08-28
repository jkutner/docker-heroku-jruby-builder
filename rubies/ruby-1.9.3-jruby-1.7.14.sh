#!/bin/sh

docker.io run -v `pwd`/builds:/tmp/output -v `pwd`/../cache:/tmp/cache -e VERSION=1.7.14 -e RUBY_VERSION=1.9.3 -t hone/jruby-builder:cedar-14
