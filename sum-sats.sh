#!/bin/sh

# 210000 blocks in each halving period
echo $(( $(sh halving.sh | awk '{print $2 "*210000"}' | paste -d"+" -s) ))
