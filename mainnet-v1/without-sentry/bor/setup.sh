#!/usr/bin/env sh

# set -x #echo on

BOR_DIR=${BOR_DIR:-~/.bor}
DATA_DIR=$BOR_DIR/data

# create bor and keystore directory
mkdir -p $BOR_DIR $BOR_DIR/keystore

# init bor
bor --datadir $DATA_DIR init ./genesis.json

# copy peers file
cp ./static-nodes.json $DATA_DIR/bor/static-nodes.json

echo "Setup done!"
