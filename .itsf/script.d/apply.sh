#!/usr/bin/env bash

set -e

source ./.itsf/config/source.file
./bin/terraform --version
./bin/terraform apply $@