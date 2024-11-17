#!/bin/sh

cat past.txt | cut -d: -f2 \
  | awk '
    NR==1{first=$1} END { printf("%d\n", ($1-first)/(NR-1)) }
    '

