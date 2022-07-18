#!/usr/bin/env sh

# PSP - handle export

set -x #echo on

BOR_DIR=${BOR_DIR:-~/.bor}
DATA_DIR=$BOR_DIR/data

bor server -config="./config.toml"
