#!/bin/sh

{
  printf "scale=8; 0"
  sh halving.sh | cut -d " " -f2 \
    | while read reward
      do
        printf "+%.8f" $(echo $reward*210000 | bc)
      done
  echo
} | bc
