#!/bin/bash

export LOG_DIR=/log/systemd
mkdir -pv $LOG_DIR

for file in `cat orders.list`;
do
  echo -n "Start building $file...";
  bash $file 1>$LOG_DIR/$file.log 2>$LOG_DIR/$file.err
  if [ $? == 0 ]; then
    echo -e "\033[01;32m\t\tSucceed\033[0m"
  else
    echo -e "\033[01;31m\t\tFailed\033[0m"
    exit 1
  fi
done
