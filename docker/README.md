This readme is for setting up full nodes for mumbai/mainnet node for matic network using docker-compose

Enter the value for `NODE_NAME` in env files for identification of your node in dashboards for mumbai network(https://bor-mumbai.vitwit.com/) and mainnet network(https://bor-mainnet.vitwit.com/)

Recommended docker-compose version
```
docker-compose version 1.29.1, build c34c88b2
docker-py version: 5.0.0
CPython version: 3.9.0
OpenSSL version: OpenSSL 1.1.1h  22 Sep 2020
```

For setting up mumbai full node:
```
docker-compose -f matic-sentry-with-snapshotting.yml --env-file mumbai.env up
```

For setting up mainnet full node:
```
docker-compose -f matic-sentry-with-snapshotting.yml --env-file mainnet.env up
```