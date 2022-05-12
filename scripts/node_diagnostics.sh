#!/usr/bin/env bash
node=$1

if [[ -z $node ]]; then
  echo -e '\e[93mWhich node you are running?(validator or sentry):'
  read node
fi

#status
Bor_Status="$(systemctl is-active bor.service)"
Heimdall_Status="$(systemctl is-active heimdalld.service)"
Heimdall_Rest_Status="$(systemctl is-active heimdalld-rest-server.service)"
Rabbitmq_Status="$(systemctl is-active rabbitmq-server.service)"
Heimdall_Bridge_Status="$(systemctl is-active heimdalld-bridge.service)"

if [ "$node" = "sentry" ]; then
   if [ "${Bor_Status}" = "inactive" ]; then
    echo -e "\e[31mOOPS! Bor is not running..."
    exit 1
   fi
   if [ "${Heimdall_Status}" = "failed" ]; then
    echo -e "\e[31mOOPS! Heimdall is not running..."
    exit 1
   fi
   if [ "${Heimdall_Rest_Status}" = "failed" ]; then
    echo -e "\e[31mOOPS! Heimdall Rest Server is not running..."
    exit 1
   fi
else
   if [ "${Bor_Status}" = "inactive" ]; then
    echo -e "\e[31mOOPS! Bor is not running..."
    exit 1
   fi
   if [ "${Heimdall_Status}" = "failed" ]; then
    echo -e "\e[31mOOPS! Heimdall is not running..."
    exit 1
   fi
   if [ "${Heimdall_Rest_Status}" = "failed" ]; then
    echo -e "\e[31mOOPS! Heimdall Rest Server is not running..."
    exit 1
   fi
   if [ "${Rabbitmq_Status}" = "failed" ]; then
    echo -e "\e[31mOOPS! Heimdall_Bridge_Status Server is not running..."
    exit 1
   fi
   if [ "${Heimdall_Bridge_Status}" = "failed" ]; then
    echo "\e[31mOOPS! Heimdalld Bridge, is not running..."
    exit 1
   fi
fi

# //check bor sync
threshold=20
var1=$(curl -X POST https://polygon-rpc.com/ --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":83}' -s | jq '.result')
var1="$(echo "ibase=16; ${var1^^}" | bc)"
var2=$(curl -H "Content-Type: application/json" -X POST http://localhost:8545/ --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":83}' -s | jq '.result')
var2="$(echo "ibase=16; ${var2^^}" | bc)"
var3="$(($var1-$var2))"

if [ "$var3" -gt "$threshold" ]; then
 echo -e "\e[31mBor is not in sync, since your current block difference - $var3 is greater than threshold(20)"
fi

# //check heimdall sync
var4=$(curl -X POST https:/tendermint.api.matic.network/status --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":83}' -s | jq '.result.sync_info.latest_block_height')
var4="$(echo "ibase=16; ${var4^^}" | bc)"
var5=$(curl -X GET http://localhost:26657/status -s | jq '.result.sync_info.latest_block_height')
var5="$(echo "ibase=16; ${var5^^}" | bc)"
var6="$(($var4-$var5))"

if [ "$var6" -gt "$threshold" ]; then
 echo -e "\e[31mHeimdall is not in sync, since your current block difference - $var6 is greater than threshold(20)"
fi

# //check if eth_rpc_url is working
if [ "$node" = "validator" ]; then
 eth_rpc_url=$(cat .heimdalld/config/heimdall-config.toml | grep 'eth_rpc_url' | awk '{printf $3}')
 eth_rpc_url="${eth_rpc_url:1:${#eth_rpc_url}-2}"
 data=$(curl -X POST $eth_rpc_url --data  '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":83}' -s)
 if [ -z "$data" ];
 then
    echo "\e[31meth_rpc_url is not working!"
 else
    echo "eth_rpc_url is working fine!"
 fi
fi


