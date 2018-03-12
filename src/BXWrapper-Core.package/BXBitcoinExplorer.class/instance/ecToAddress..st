commands-wallet
ecToAddress: input
	^ self run: (self newCommand: 'ec-to-address' input: input)