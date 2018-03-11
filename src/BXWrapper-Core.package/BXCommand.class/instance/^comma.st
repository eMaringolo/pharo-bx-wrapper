chaining
, aBXCommand

	^BXChainedCommand new
		setCommand: self command;
		next: aBXCommand;
		yourself