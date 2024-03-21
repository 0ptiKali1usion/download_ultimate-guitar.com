#!/bin/bash
#https://tabs.ultimate-guitar.com/download/public/3310721
#curl -OLv https://tabs.ultimate-guitar.com/download/public/$1
#export http_proxy=http://127.0.0.1:8080
#export https_proxy=http://127.0.0.1:8080

curl -k $1 | grep '<link rel="alternate" hreflang="x-default" href="https://tabs.ultimate-guitar.com/tab/' | tr '"' '\n' | grep http | xargs -I '{}' curl -OJL -s -k -X $'GET' \
    -H $'Host: tabs.ultimate-guitar.com' -H $'Referer: ''{}' \
#    -b $'bbuserid=999999999; bbusername=JJZot; bbpassword= (LM [DES 128/128 SSE2]) type hash' \
#    -b $'bbuserid=; bbusername=; bbpassword=' \
    $'https://tabs.ultimate-guitar.com/download/public/'$2
