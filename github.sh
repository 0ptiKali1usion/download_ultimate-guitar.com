#!/bin/sh
#my download everything fron ultimate-guitar.com script
#-JJ
curl -OJLkv 'https://www.ultimate-guitar.com/sitemap.xml'
grep '<loc>' sitemap.xml | tr '<' '\n' | tr '>' '\n' | tr ' ' '\n' | grep http > sitemaps.xml.tmp
curl -OJLkv 'https://www.ultimate-guitar.com/sitemap[1-36].xml'
grep '<loc>' sitemap.xml | tr '<' '\n' | tr '>' '\n' | tr ' ' '\n' | grep http | sort -a > content.tmp

