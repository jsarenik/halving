#!/bin/sh
#
# from bitcoin/src/validation.cpp:
# // Subsidy is cut in half every 210,000 blocks
#    which will occur approximately every 4 years.

compute() {
  reward=${1:-50}
  block=${2:-0}
  year=${3:-2009}
  # get the real year from past.txt data
  PAST=$(grep "^$block:" past.txt) \
    && year=$(echo $PAST | cut -d: -f2 | cut -d- -f1)

  printf "%d %.8f %d\n" $block $reward $year
  test "$reward" = "0" && return 1
  compute $(echo "scale=8; $reward/2" | bc) $(($block+210000)) $(($year+4))
}

compute
