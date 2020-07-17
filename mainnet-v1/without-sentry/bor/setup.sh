#!/usr/bin/env sh

# set -x #echo on

BOR_DIR=${BOR_DIR:-~/.bor}
DATA_DIR=$BOR_DIR/data
NODE_KEY=~/nodekey

# create bor and keystore directory
mkdir -p $BOR_DIR $BOR_DIR/keystore

# init bor
bor --datadir $DATA_DIR init ./genesis.json

# copy peers file
cp ./static-nodes.json $DATA_DIR/bor/static-nodes.json

# if node key not present, create nodekey
if [ ! -f $NODE_KEY ]; then
  bootnode -genkey $NODE_KEY
fi

# copy node key file
cp $NODE_KEY $DATA_DIR/bor/

echo "Setup done!"
