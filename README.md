# Random Beacon Injector Bot

This is a simple script/bot that every 10 minutes grabs the latest NIST random
beacon, and a few blockhashes from various chains, concatenates them and
timestamps that file. This serves two purposes:

1. Timestamps the chain, proving the random beacon existed prior to a BTC
   block.
2. Injects a dependency on the beacon into the BTC chain, proving that
   subsequent BTC blocks were created after the beacon.

Why? Might be useful, kinda fun, and took an hour or three to setup.

