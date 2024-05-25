#!/bin/bash

INPUT=$(xinput | grep Touchpad)

SUBSTRING=$(echo $INPUT | cut -d '↳' -f 1)
echo $SUBSTRING
