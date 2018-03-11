printing
commandChainString
	^ String streamContents: [ :s | self printCommandChainOn: s ]