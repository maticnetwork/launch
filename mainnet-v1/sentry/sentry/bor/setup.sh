#!/usr/bin/env sh

# set -x #echo on

BOR_DIR=${BOR_DIR:-~/.bor}
DATA_DIR=$BOR_DIR/dataDir
BUILD_DIR=$GOPATH/src/github.com/maticnetwork/bor/build/bin

# create bor, logs and keystore directory
mkdir -p $BOR_DIR
mkdir -p $BOR_DIR/logs
mkdir -p $BOR_DIR/keystore

# init bor
$BUILD_DIR/bor --datadir $DATA_DIR init ./genesis.json

# copy peers file
cp ./static-nodes.json $DATA_DIR/bor/static-nodes.json

echo "Setup done!"
