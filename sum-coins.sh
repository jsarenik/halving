#!/bin/sh

{
  printf "scale=8; 0"
  sh halving.sh | awk '{print $2}' \
    | while read reward
      do
        printf "+%.8f" $(echo $reward*210000 | bc)
      done
  echo
} | bc
