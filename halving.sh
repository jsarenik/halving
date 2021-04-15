#!/bin/sh
#
# from bitcoin/src/validation.cpp:
# // Subsidy is cut in half every 210,000 blocks
#    which will occur approximately every 4 years.

compute() {
  block=${1:-0}
  reward=${2:-50.0}
  date=${3}
  # get the real yyyy-mm-dd from past.txt data
  PAST=$(grep "^$block:" past.txt) \
    && date=${PAST#*:}
  printf '%7d %11.8f %s\n' $block $reward ${date%%-*}
  test "$reward" = "0" && return 1

  time=$(date +%s -d "$date")
  next=$(date +%Y-%m-%d -d "@$(($time+210000*10*60))")
  compute $(($block+210000)) $(echo "scale=8; $reward/2" | bc) $next
}

compute
