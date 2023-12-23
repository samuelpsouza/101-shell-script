#!/bin/bash
#
# cinco.sh
#
# Conca até cinco

echo $((0+1))
echo $((0+2))

set -xv		# Liga debug

echo $((0+3))
echo $((0+4))

set +xv		# Desliga debug

echo $((0+5))
