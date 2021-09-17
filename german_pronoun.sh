#!/bin/bash

function de(){
        fileName="$1.temp"
        dudenURL="https://www.duden.de/suchen/dudenonline/$1"
        wget "$dudenURL" --quiet -O "$fileName"
        answer="$(grep "strong" "$fileName" | head -2 | tail -1 | sed -E "s|<(/)?strong>||g" | sed "s|^\s*||g")"
        attributes="$(grep -A 3 vignette__snippet "$fileName" | head -4 | tail -1 | sed 's/–.*$//g' | sed "s|^\s*||g")"
        echo "$answer: $attributes"
        rm "$fileName"
}

de $1
