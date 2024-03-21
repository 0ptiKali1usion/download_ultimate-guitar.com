#!/bin/sh
# "my download everything fron ultimate-guitar.com script."
# "it should be good for most any site that provides      "
# "browsers with sitemap.xml files. Let's say, if you want"
# "to mod it and make it download another site. that's on "
# "you for now. Also, F.Y.I, I do not consider this a     "
# "breach, no, not security. just a site, serving. and me "
# "leeching.                                              "
# "-JJ                                                    "

mkdir .ug_wrrrrq

mv download_scripts.tar .ug_wrrrrq

cd .ug_wrrrrq

tar xf download_scripts.tar

curl -OJLkv 'https://www.ultimate-guitar.com/sitemap.xml'

grep '<loc>' ./sitemap.xml | tr '<' '\n' | tr '>' '\n' | tr ' ' '\n' | grep http > ./sitemaps.xml.tmp

curl -OJLkv 'https://www.ultimate-guitar.com/sitemap[1-36].xml'

grep '<loc>' ./sitemap*.xml | tr '<' '\n' | tr '>' '\n' | tr ' ' '\n' | grep http | sort -u > ./content.tmp

cat ./content.tmp | sed 's/$/{/g' > ./contentIDs.tmp

cat ./contentIDs.tmp | tr \- '\n' | grep '{' > ./contentIDs.txt

cat -n ./contentIDs.txt > ./contentIDs_numbered.tmp

cat -n ./content.tmp > ./content_numbered.tmp

join ./content_numbered.tmp ./contentIDs_numbered.tmp > ./ball.sh.tmp

cat ./ball.sh.tmp | sed 's/ https/}https/g' | tr '}' '\n' | grep '{' | tr '{' ' ' | sed 's/^/\.\/download2.sh /g' > ./ball.sh

chmod +x ./*.sh

sh ./ball.sh
