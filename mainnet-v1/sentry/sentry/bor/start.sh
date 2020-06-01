#!/usr/bin/env sh

set -x #echo on

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
  --syncmode 'full' \
  --networkid '137' \
  --miner.gaslimit '200000000' \
  --miner.gastarget '20000000' \
  --txpool.nolocals \
  --txpool.accountslots '128' \
  --txpool.globalslots '20000'  \
  --txpool.lifetime '0h16m0s' \
  --maxpeers 200 \
  --metrics \
  --pprof --pprofport 7071 --pprofaddr '0.0.0.0'
