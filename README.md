# Random Beacon Injector Bot

This is a simple script/bot that every 10 minutes grabs the latest NIST random
beacon and a few blockhashes from various chains, concatenates them, and
timestamps that file. This serves two purposes:

1. Timestamps the random beacons, proving they existed prior to a Bitcoin
   block.
2. Injects a commitment to the beacons into the Bitcoin chain, proving that
   Bitcoin blocks were created after the beacons.

In conjunction with the [Restamp Project](https://github.com/opentimestamps/restamp),
this provides evidence that can constrain when Bitcoin blocks were created both
forwards and backwards in time.
