#!/bin/sh
#
# from bitcoin/src/validation.cpp:
# // Subsidy is cut in half every 210,000 blocks
#    which will occur approximately every 4 years.
four=${1:-$(./shack.sh 2>/dev/null)}
four=${four:-122866255} # avg generated from past.txt by shack.sh
#four=126000000 # upper limit 600s avg blocks
#four=$(./shack-full.sh)

compute() {
  block=${1:-0}
  subsidy=${2:-5000000000}
  time=${3:-1231006505} # default is genesis block time
  # get the real time from past.txt data
  PAST=$(grep "^$block:" past.txt) \
    && { time=${PAST#*:}; }
  year=$(date +%Y-%m-%d -d @$time)

  printf '%7d %10d %s\n' $block $subsidy $year
  test "$subsidy" = "0" || \
    compute $(($block+210000)) $(($subsidy>>1)) $(($time+$four))
}

compute
