#!/bin/bash

USE_COLORS=1              # Flag to use colors (0 off, 1 on)

# VT100 does not support colors

if test "$TERM" = "vt100"
then
	USE_COLORS=0
fi
