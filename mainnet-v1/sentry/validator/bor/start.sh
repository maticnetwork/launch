#!/usr/bin/env sh

set -x #echo on

if [ -z "$1" ]
  then
    echo "Address is required as argument"
  exit 1
fi

ADDRESS=$1
BOR_DIR=${BOR_DIR:-~/.bor}
DATA_DIR=$BOR_DIR/data

bor --datadir $DATA_DIR \
  --port 30303 \
  --rpc --rpcaddr '0.0.0.0' \
  --rpcvhosts '*' \
  --rpccorsdomain '*' \
  --rpcport 8545 \
  --ipcpath $DATA_DIR/bor.ipc \
  --rpcapi 'db,eth,net,web3,txpool,bor' \
  --networkid '137' \
  --syncmode 'full' \
  --miner.gaslimit '200000000' \
  --miner.gastarget '20000000' \
  --txpool.nolocals \
  --txpool.accountslots '128' \
  --txpool.globalslots '20000'  \
  --txpool.lifetime '0h16m0s' \
  --keystore $BOR_DIR/keystore \
  --unlock $ADDRESS \
  --password $BOR_DIR/password.txt \
  --allow-insecure-unlock \
  --nodiscover --maxpeers 1 \
  --metrics \
  --pprof --pprofport 7071 --pprofaddr '0.0.0.0' \
  --mine
