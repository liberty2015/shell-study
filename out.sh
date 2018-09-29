# !/bin/bash

function output(){
	color=$1;
	content=$2;
	echo -ne "\033[$color$content\033[0m"
}

colors=(33m 34m 35m 36m 37m)
# 31m 32m
function obtainColor(){
	let index=$1%${#colors[@]};
	echo ${colors[$index]};
}

function success(){
	echo -ne "\033[32m$1\033[0m"
}

function fail(){
	echo -ne "\033[31m$1\033[0m"
}

function taskFinish(){
	echo "The Task $1 has finished."
	echo "1. Return to the previous level."
	echo "2. Continue Task $1."
	read 
}