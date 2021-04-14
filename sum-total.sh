#!/bin/sh

{
  printf "scale=8; a=0"
  sh halving.sh | cut -d " " -f2 \
    | while read reward
      do
        printf "+%.8f" $reward
      done
  echo "; print a, \"%\\\n\""
} | bc
