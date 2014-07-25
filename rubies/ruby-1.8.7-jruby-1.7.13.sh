#!/bin/sh

docker.io run -v `pwd`/builds:/tmp/output -v `pwd`/../cache:/tmp/cache -e VERSION=1.7.13 -e RUBY_VERSION=1.8.7 -t hone/jruby-builder
