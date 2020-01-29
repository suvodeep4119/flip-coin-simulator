#!/bin/bash -x

echo "Welcome to Flip Coin Simulator"

#ASSUMPTIONS: 1= HEADS 0=TAILS

#DICTIONARY
declare -A singlet=( [0]=0 [1]=0 )
declare -A doublet=( [00]=0 [01]=0 [10]=0 [11]=0 )

#VARIABLES
multiple=0

read -p "Please enter a value in multiples of 2: " multiple

function singlet(){
	local randomValue=$((RANDOM%2))
	echo $randomValue
}

function doublet(){
	local r1=$((RANDOM%2))
	local r2=$((RANDOM%2))
	local randomValue="${r1}${r2}"
	echo $randomValue
}

while (( i<multiple ))
do
	r=$(singlet)
	case $r in
		1)
		singlet[$r]=$(( ${singlet[$r]}+1 ))
		;;
		0)
		singlet[$r]=$(( ${singlet[$r]}+1 ))
		;;
		*)
		echo "Nothing"
		;;
	esac
	r=$(doublet)
	case $r in
		00)
		doublet[$r]=$(( ${doublet[$r]}+1 ))
		;;
		01)
		doublet[$r]=$(( ${doublet[$r]}+1 ))
		;;
		10)
		doublet[$r]=$(( ${doublet[$r]}+1 ))
		;;
		11)
		doublet[$r]=$(( ${doublet[$r]}+1 ))
		;;
		*)
		echo "Nothing"
		;;
	esac
	(( i++ ))
done

#Percentage Calculation Singlet
percentCombination=`echo "scale=2; ${singlet[1]}*100/$multiple" | bc`
echo "% of HEADS occurence: " $percentCombination
percentCombination=`echo "scale=2; ${singlet[0]}*100/$multiple" | bc`
echo "% of TAILS occurence: " $percentCombination


#Percentage Calculation Doublet
percentCombination=`echo "scale=2; ${doublet[00]}*100/$multiple" | bc`
echo "TT %:" $percentCombination

percentCombination=`echo "scale=2; ${doublet[11]}*100/$multiple" | bc`
echo "HH %:" $percentCombination

percentCombination=`echo "scale=2; ${doublet[10]}*100/$multiple" | bc`
echo "HT %:" $percentCombination

percentCombination=`echo "scale=2; ${doublet[01]}*100/$multiple" | bc`
echo "TH %:" $percentCombination
