This readme is for setting up full nodes for mumbai/mainnet node for matic network using docker-compose

Download the latest snapshot for mainnet full node. We periodically take new snapshots and will publish new links.
```
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mainnet/bor-fullnode-snapshot-2021-06-16.tar.gz
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mainnet/heimdall-fullnode-snapshot-2021-06-16.tar.gz
```

Download the latest snapshot for mumbai full node
```
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mumbai/bor-snapshot-2021-03-19.tar.gz
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mumbai/heimdall-snapshot-2021-03-19.tar.gz
```

Download the latest snapshot for mainnet archive node. We periodically take new snapshots and will publish new links.
```
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mainnet/bor-archive-node-snapshot-2021-06-17.tar.gz
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mainnet/heimdall-archive-node-snapshot-2021-06-17.tar.gz
```

Note - If you are using different snapshot files, make changes for file names accordingly in the env files. We periodically take new snapshots and will publish new links.

By default, archive mode is enabled in .env files. To start full node, set BOR_MODE=full

Recommended docker-compose version
```
docker-compose version 1.29.1, build c34c88b2
docker-py version: 5.0.0
CPython version: 3.9.0
OpenSSL version: OpenSSL 1.1.1h  22 Sep 2020
```

Run the following commands for local volumes to be mounted in docker-compose file
```
mkdir -p heimdall/snapshot
mkdir -p heimdall/scripts
mkdir -p bor/snapshot
mv <path-to-heimdall-snapshot-file> heimdall/snapshot
mv <path-to-bor-snapshot-file> bor/snapshot
mv heimdall-startup.sh heimdall/scripts
```

For setting up nodes:
```
docker-compose -f matic-sentry-with-snapshotting.yml --env-file <env-file> up
```

If your docker-compose doesn't support `--env-file` flag, then copy mumbai.env/mainnet.env to `.env` and run the following command

For setting up nodes:
```
docker-compose -f matic-sentry-with-snapshotting.yml up
```

For checking the status of heimdall use the following api
```
http://localhost:26657/status
```