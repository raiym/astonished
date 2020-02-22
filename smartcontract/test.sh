#!/bin/bash

./build.sh 

echo "\nCompilation completed\n"

export FIFTPATH=~/TON/ton/crypto/fift/lib
~/TON/build/crypto/fift -s lottery-test-suite.fif
