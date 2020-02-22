#!/bin/bash

~/TON/build/crypto/func -SPA -R -o lottery-compiled.fif ~/TON/ton/crypto/smartcont/stdlib.fc ./lottery-code.fc

cp lottery-compiled.fif lottery-compiled-for-test.fif
sed '$d' lottery-compiled-for-test.fif > test.fif
rm lottery-compiled-for-test.fif
mv test.fif lottery-compiled-for-test.fif
echo -n "}END>s constant code" >> lottery-compiled-for-test.fif
mv lottery-compiled.fif ./build/
mv lottery-compiled-for-test.fif ./build/
