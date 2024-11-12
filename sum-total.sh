#!/bin/sh

echo $(( $(sh sum-sats.sh)/21 )) | sed 's/0\+$//;s/^\(..\)\(.*\)/\1.\2%/'
