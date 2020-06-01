#!/usr/bin/env sh

NODE_DIR=${NODE_DIR:-$HOME/node}
BIN_DIR=$(go env GOPATH)/bin
USER=$(whoami)

cat > bor.service <<EOF
[Unit]
  Description=bor

[Service]
  WorkingDirectory=$NODE_DIR
  ExecStartPre=/bin/chmod +x $NODE_DIR/bor/start.sh
  ExecStart=/bin/bash $NODE_DIR/bor/start.sh $1
  Type=simple
  User=$USER
EOF

cat > heimdalld.service <<EOF
[Unit]
  Description=heimdalld

[Service]
  WorkingDirectory=$NODE_DIR
  ExecStart=$BIN_DIR/heimdalld start
  Type=simple
  User=$USER
EOF

cat > heimdalld-rest-server.service <<EOF
[Unit]
  Description=heimdalld-rest-server

[Service]
  WorkingDirectory=$NODE_DIR
  ExecStart=$BIN_DIR/heimdalld rest-server
  Type=simple
  User=$USER
EOF

cat > heimdalld-bridge.service <<EOF
[Unit]
  Description=heimdalld-bridge

[Service]
  WorkingDirectory=$NODE_DIR
  ExecStart=$BIN_DIR/bridge start --all
  Type=simple
  User=$USER
EOF

