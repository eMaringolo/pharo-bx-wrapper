commands-wallet
ecToPublic: input
	^ self run: (self newCommand: 'ec-to-public' input: input)