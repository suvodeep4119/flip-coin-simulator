#!/bin/bash -x

echo "Welcome to Flip Coin Simulator"

randomValue=$((RANDOM%2))
if [ $randomValue -eq 1 ]
then
	echo "HEADS"
else
	echo "TAILS"
fi

