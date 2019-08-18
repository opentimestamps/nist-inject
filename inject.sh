#!/bin/bash

cd /home/ots/nist-inject

FILE=`date +%Y/%m/%d/%Y-%m-%d_%H:%M:%S`.txt
echo $FILE
mkdir -p db/`dirname $FILE`
curl https://beacon.nist.gov/beacon/2.0/pulse/last > db/$FILE
echo >> db/$FILE
curl https://api.blockcypher.com/v1/ltc/main | egrep '"(hash|height|name)"' >> db/$FILE
curl https://api.blockcypher.com/v1/eth/main | egrep '"(hash|height|name)"' >> db/$FILE
curl https://api.zcha.in/v2/mainnet/network | python -m json.tool |grep blockHash >> db/$FILE
ots stamp db/$FILE

git add -A db/
git commit -m .
git push
