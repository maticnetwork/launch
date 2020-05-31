#!/usr/bin/env sh

# set -x #echo on

if [ -z "$1" ]
  then
    echo "Address is required as argument"
  exit 1
fi

ADDRESS=$1
BOR_DIR=${BOR_DIR:-~/.bor}
DATA_DIR=$BOR_DIR/dataDir
BUILD_DIR=$GOPATH/src/github.com/maticnetwork/bor/build/bin

mkdir -p $BOR_DIR/logs

$BUILD_DIR/bor --datadir $DATA_DIR \
  --port 30303 \
  --rpc --rpcaddr '0.0.0.0' \
  --rpcvhosts '*' \
  --rpccorsdomain '*' \
  --rpcport 8545 \
  --ipcpath $DATA_DIR/geth.ipc \
  --rpcapi 'db,eth,net,web3,txpool,bor' \
  --networkid '2008' \
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
  --maxpeers 200 \
  --metrics \
  --pprof --pprofport 7071 --pprofaddr '0.0.0.0' \
  --mine > $BOR_DIR/logs/bor.log 2>&1 &

echo "Node started! Logs are being written to $BOR_DIR/logs/bor.log"
