I'm the wrapper of the bitcoin-explorer (bx) command line utility. 
More info at: https://github.com/libbitcoin/libbitcoin-explorer

I'm simply a convenience class to instantiate new commands, so a single instance of me is enough to instantiate different commands, since I keep no state.

| bx |
bx := BXBitcoinExplorer new.
bx seed run. "inspect ouput" 
(bx seed, bx ecNew, bx ecToPublic, bx ecToAddress) run. 

