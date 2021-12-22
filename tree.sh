#!/bin/bash

play ./christmas.mp3 > tree.log 2>&1 &
trap "tput reset; tput cnorm; exit" 2
clear
tput civis
lin=2
col=$(($(tput cols) / 2))
c=$((col-1))
est=$((c-2))
color=0
tput setaf 2; tput bold

# Tree Part
for ((annie=1; annie<25; annie+=2))
{
	tput cup $lin $col
	for ((ttfish=1; ttfish<=annie; ttfish++))
	{
		echo -n \*
	}
	let lin++
	let col--
}

tput sgr0; tput setaf 3

# Trunk Part
for ((annie=1; annie<=5; annie++))
{
	tput cup $((lin++)) $c
	echo 'NMN'
}

tput setaf 1; tput bold
tput cup $((lin + 1)) $((c - 11)); echo TTFISH AND TTFISH EVERYDAY | lolcat -a -d 40 
echo ''
figlet -c MERRY CHRISTMAS |lolcat -a -s 40

let c++
k=1

# Decorate with Fish
for ((annie=1; annie<=200; annie++)) {
	[ $k -gt 1 ] && {
		tput setaf 2; tput bold
		tput cup ${line[$[k-1]$annie]} ${column[$[k-1]$annie]}; echo \*
		unset line[$[k-1]$annie]; unset column[$[k-1]$annie]
	}

	li=$((RANDOM % 11 + 3))
	start=$((c-li+2))
	co=$((RANDOM % (li-1) * 2 + start))
	tput setaf $color; tput bold  
	tput cup $li $co
	printf '\xF0\x9F\x90\x9F' # Replace with any hexadecimal represented emoji
	line[$k$annie]=$li
	column[$k$annie]=$co
	color=$(((color+1)%8))
	sh=1

# Loop for fun
	for l in F I S H
	do
		sleep 0.05
	done
}
# Loop for fun
while true; do
done 