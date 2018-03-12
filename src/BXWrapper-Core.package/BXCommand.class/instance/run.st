running
run
	| p |
	p := OSSUnixSubprocess new.
	p command: self bxCommandName.
	p arguments: self commandAndArguments.
	^ [ p redirectStdout.
	p redirectStderr.
	self hasInput
		ifTrue: [ p redirectStdin ].
	p run.
	self hasInput
		ifTrue: [ p stdinStream
				nextPutAll: self input asString;
				close ].
	p waitForExit.
	p isSuccess
		ifTrue: [ p stdoutStream upToEndOfFile trimBoth ]
		ifFalse: [ | message |
			message := p stderrStream upToEndOfFile.
			self error: message ] ]
		ensure: [ p closeAndCleanStreams ]