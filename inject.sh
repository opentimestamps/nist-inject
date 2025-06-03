#!/bin/bash

cd /home/ots/nist-inject

FILE=`date +%Y/%m/%d/%Y-%m-%d_%H:%M:%S`.txt
echo $FILE
mkdir -p db/`dirname $FILE`
curl https://beacon.nist.gov/beacon/2.0/pulse/last > db/$FILE
echo >> db/$FILE
curl https://api.blockcypher.com/v1/ltc/main | egrep '"(hash|height|name)"' >> db/$FILE
curl https://api.blockcypher.com/v1/eth/main | egrep '"(hash|height|name)"' >> db/$FILE
(curl https://blockstream.info/liquid/api/blocks/tip/hash && echo -n ' ' && curl https://blockstream.info/liquid/api/blocks/tip/height && echo ) >> db/$FILE
ots stamp db/$FILE

git add -A db/
git commit -m .
git push
