#!/bin/bash

TARGET=$1

subfinder -d $TARGET 2>>error.log  | \
anew all-subdomain.txt | \
httpx -sc 2>>error.log | \
tee ${TARGET}_livehost.txt | \
while read line; do
echo "[$(date '+%Y-%m-%d %H:%M:%S')] $line";
done | \
tee -a progress.log


