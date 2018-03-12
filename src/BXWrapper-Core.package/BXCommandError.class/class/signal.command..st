signalling
signal: aString command: aBXCommand
	^ self new
		messageText: aString;
		tag: aBXCommand;
		signal