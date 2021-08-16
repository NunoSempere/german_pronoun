#!/bin/bash

function de(){
	dudenURL="https://www.duden.de/rechtschreibung/$1"
	fileName="$1.temp"
	wget "$dudenURL" --quiet -O "$fileName"
	grep -A 1 Wortart "$fileName" | tail -1 | sed 's/.*">//' | sed 's/<.*//' 
	rm "$fileName"
}

de $1
