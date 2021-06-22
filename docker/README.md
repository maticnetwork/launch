This readme is for setting up full nodes for mumbai/mainnet node for matic network using docker-compose

Enter the value for `NODE_NAME` in env files for identification of your node in dashboards for mumbai network(https://bor-mumbai.vitwit.com/) and mainnet network(https://bor-mainnet.vitwit.com/)

Download the latest snapshot for mainnet
```
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mainnet/bor-fullnode-snapshot-2021-06-16.tar.gz
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mainnet/heimdall-fullnode-snapshot-2021-06-16.tar.gz
```

Download the latest snapshot for mumbai
```
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mumbai/bor-snapshot-2021-03-19.tar.gz
wget -c https://matic-blockchain-snapshots.s3.amazonaws.com/matic-mumbai/heimdall-snapshot-2021-03-19.tar.gz
```

PS - If you are using different snapshot files, make changes accordingly in the env files

Recommended docker-compose version
```
docker-compose version 1.29.1, build c34c88b2
docker-py version: 5.0.0
CPython version: 3.9.0
OpenSSL version: OpenSSL 1.1.1h  22 Sep 2020
```

NOTE: Start bor service only when heimdall is fully synced
NOTE: Replace the host volumes in docker-compose file accordingly with snapshots and scripts

For setting up full node using snapshots:
```
docker-compose -f matic-sentry-with-snapshotting.yml --env-file <env-file> up
```

If your docker-compose doesn't support `--env-file` flag, then copy mumbai.env/mainnet.env to `.env` and run the following command

For setting up full node:
```
docker-compose -f matic-sentry-with-snapshotting.yml up
```
