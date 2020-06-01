# Matic Mainnet

## The Matic mainnet v1 launch

The Matic Foundation is releasing the genesis information for the Matic mainnet along with associated Release software.

Please be aware that there is no guarantee a network will start from this recommendation - nodes and validators may never come online, the community may disregard the recommendation and choose different genesis files, and/or they may modify the software in arbitrary ways. Such outcomes and many more are outside the Matic Foundation's control and completely in the hands of the community.

The recommended genesis file is `genesis.json`. It has the following SHA256 hash:

```
$ shasum -a 256 bor/genesis.json 
808755d2738f8170d5673f6a5955687c76e472b31346b61f9e6f8e49244b9854  bor/genesis.json

$ shasum -a 256 heimdall/config/genesis.json
498669113c72864002c101f65cd30b9d6b159ea2ed4de24169f1c6de5bcccf14  heimdall/config/genesis.json

$ b2sum bor/genesis.json 
0c0838db3f0f5d9645f25420b67c478be1bf6c5461c8c08f5999ded2132c0e305531a7494e09f6d1a7be37eaefcd52b267087544916da6f31801b3bfed39c583  bor/genesis.json

$ b2sum heimdall/config/genesis.json
cb980d1a9e94499200181a33860358110c9fe2901090d4415e7244e1c10a8085b6abe68ade9cb9532052b65a445cf031925d4c84f54f0c44d998a94d423208d7  heimdall/config/genesis.json
```

It includes a genesis time of 2020-05-30T04:28:03.177054Z. 

The recommended software version is v0.2.0 of the [Heimdall]() and [Bor]() node software. See the installation instructions and the guide to joining mainnet [here]().

Users wishing to interact with the network should carefully review how to protect themselves and the security advisories in the recent communication provided in the docs on preparing for main net launch.

Please note that this is highly experimental software. In these early days, we can expect to have issues, updates, and bugs. The existing tools require advanced technical skills and involve risks which are outside of the control of the Matic Foundation and/or the Matic team. Any use of this open source software is done at your own risk and on a “AS IS” basis, without warranties or conditions of any kind, and any and all liability of the Matic Foundation and/or the Matic team for damages arising in connection to the software is excluded. Please exercise extreme caution!

Further, please note that it remains in the community's sole discretion to adopt or not to adopt the recommended genesis info and associated software. 

## Seed Nodes
We request known community members who wish to run public p2p seed nodes make pull requests to add community run seed nodes below.

```
Seed nodes


```
