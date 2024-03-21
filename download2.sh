#!/bin/bash
#https://tabs.ultimate-guitar.com/download/public/3310721
#curl -OLv https://tabs.ultimate-guitar.com/download/public/$1
#export http_proxy=http://127.0.0.1:8080
#export https_proxy=http://127.0.0.1:8080

curl -Lvk $1 | grep '<link rel="alternate" hreflang="x-default" href="https://tabs.ultimate-guitar.com/tab/' | tr '"' '\n' | grep http | xargs -I '{}' ./download.sh '{}' $2
