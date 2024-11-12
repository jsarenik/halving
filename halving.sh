#!/bin/sh
#
# from bitcoin/src/validation.cpp:
# // Subsidy is cut in half every 210,000 blocks
#    which will occur approximately every 4 years.

compute() {
  block=${1:-0}
  subsidy=${2:-5000000000}
  year=${3:-2009}
  # get the real year from past.txt data
  PAST=$(grep "^$block:" past.txt) \
    && { PAST=${PAST#*:}; year=${PAST%%-*}; }

  printf '%7d %10d %d\n' $block $subsidy $year
  test "$subsidy" = "0" || \
    compute $(($block+210000)) $(($subsidy/2)) $(($year+4))
}

compute
