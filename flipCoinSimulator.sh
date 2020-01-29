#!/bin/bash -x

echo "Welcome to Flip Coin Simulator"

#ASSUMPTIONS: 1= HEADS 0=TAILS

#DICTIONARY
declare -A singlet=( [0]=0 [1]=0 )

#VARIABLES
multiple=0

read -p "Please enter a value in multiples of 2: " multiple

function singlet(){
	local randomValue=$((RANDOM%2))
	echo $randomValue
}

while (( i<multiple ))
do
	r=$(singlet)
	if [ $r -eq 1 ]
	then
		singlet[$r]=$(( ${singlet[$r]}+1 ))
	else
		singlet[$r]=$(( ${singlet[$r]}+1 ))
	fi
	(( i++ ))
done

#Percentage Calculation Singlet
percentCombination=`echo "scale=2; ${singlet[1]}*100/$multiple" | bc`
echo "% of HEADS occurence: " $percentCombination
percentCombination=`echo "scale=2; ${singlet[0]}*100/$multiple" | bc`
echo "% of TAILS occurence: " $percentCombination


