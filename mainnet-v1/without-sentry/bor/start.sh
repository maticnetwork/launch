#!/usr/bin/env sh

# PSP - handle export

set -x #echo on

if [ -z "$1" ]
  then
    echo "Address is required as argument"
  exit 1
fi

export ADDRESS=$1
export BOR_DIR=${BOR_DIR:-~/.bor}
export DATA_DIR=$BOR_DIR/data

bor server -config="./config.toml"
