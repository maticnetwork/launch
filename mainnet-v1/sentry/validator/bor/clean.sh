#!/usr/bin/env sh

BOR_DIR=${BOR_DIR:-~/.bor}

bash ./stop.sh
rm -rf $BOR_DIR/dataDir $BOR_DIR/logs
