#!/bin/sh

{
  printf "scale=8; a=0"
  sh halving.sh | awk '{print $2}' \
    | while read reward
      do
        printf "+%.8f" $reward
      done
  echo "; print a, \"%\\\n\""
} | bc
