#!/bin/sh
#
# from bitcoin/src/validation.cpp:
# // Subsidy is cut in half every 210,000 blocks
#    which will occur approximately every 4 years.

compute() {
  block=${1:-0}
  reward=${2:-50.0}
  year=${3:-2009}
  # get the real year from past.txt data
  PAST=$(grep "^$block:" past.txt) \
    && { PAST=${PAST#*:}; year=${PAST%%-*}; }

  printf '%7d %11.8f %d\n' $block $reward $year
  test "$reward" = "0" || \
    compute $(($block+210000)) $(echo "scale=8; $reward/2" | bc) $(($year+4))
}

compute
