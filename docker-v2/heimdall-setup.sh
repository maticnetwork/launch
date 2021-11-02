#!/bin/bash

set -e

ENV_FILE="$1.env"
export $(xargs < $ENV_FILE)

rm -rf $HEIMDALL_DIR
mkdir -p $HEIMDALL_DIR

# Init heimdall directory
./heimdalld init --home $HEIMDALL_DIR/.heimdalld --chain-id $HEIMDALL_CHAIN_ID

# TODO - Check if snapshot is downloaded and applied

# Download snapshot
# wget -c $HEIMDALL_SNAPSHOT_URL -P $HEIMDALL_DIR
# tar -xzvf $HEIMDALL_DIR/$HEIMDALL_SNAPSHOT_FILE -C $HEIMDALL_DIR/.heimdalld/data

cp ../$NETWORK-$VERSION/sentry/sentry/heimdall/config/genesis.json $HEIMDALL_DIR/.heimdalld/config
sed -i "s/seeds =.*/seeds = ${HEIMDALL_SEEDS}/" $HEIMDALL_DIR/.heimdalld/config/config.toml
sed -i "s/127.0.0.1:26657/0.0.0.0:26657/" $HEIMDALL_DIR/.heimdalld/config/config.toml
sed -i "s~http://localhost:8545~${HEIMDALL_BOR_RPC_URL}~" $HEIMDALL_DIR/.heimdalld/config/heimdall-config.toml

cp heimdalld $HEIMDALL_DIR
