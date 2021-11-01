#!/bin/bash

set -e

ENV_FILE="$1.env"
export $(xargs < $ENV_FILE)

# rm -rf $BOR_DIR
mkdir -p $BOR_DIR

cp ./bor /Users/arpittemani/.gvm/pkgsets/go1.15.1/global/bin/
cp ./bootnode /Users/arpittemani/.gvm/pkgsets/go1.15.1/global/bin/

# cp ./bor /usr/local/bin/
# cp ./bootnode /usr/local/bin/

cp ../$NETWORK/sentry/sentry/bor/setup.sh ./
cp ../$NETWORK/sentry/sentry/bor/genesis.json ./
cp ../$NETWORK/sentry/sentry/bor/static-nodes.json ./
cp ../$NETWORK/sentry/sentry/bor/start.sh ./

bash setup.sh

# TODO - Check if snapshot is downloaded and applied

wget -c $BOR_FULL_NODE_SNAPSHOT_URL -P $BOR_DIR
tar -xzvf $BOR_DIR/$BOR_FULL_NODE_SNAPSHOT_FILE -C $BOR_DIR/.bor/data/bor/chaindata

sed -i "/datadir/a --bootnodes \"${BOR_BOOTNODES}\" \\\ " ./start.sh
sed -i "/datadir/a --bor.heimdall http:\/\/heimdall0:1317 \\\ " ./start.sh
