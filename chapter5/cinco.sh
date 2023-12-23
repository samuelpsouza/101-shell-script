#!/bin/bash
#
# cinco.sh
#
# Conca até cinco

echo $((0+1))
echo $((0+2))

set -xv		# Liga debug
trap read DEBUG

echo $((0+3))
echo $((0+4))

trap "" DEBUG
set +xv		# Desliga debug

echo $((0+5))
