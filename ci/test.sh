#!/bin/bash

set -e -x

echo `pwd`
ls .
pushd repo
    bundle install
    bundle exec rspec
popd