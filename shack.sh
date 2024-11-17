#!/bin/sh

cat past.txt | cut -d: -f2 \
  | awk '
    NR>1&&$1-prev>120e6{ sum=$1-prev+sum; p+=1 }
    { prev=$1 }
    END { printf("%d\n", sum/p) }
    '
