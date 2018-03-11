running
runWith: aString
	"Runs receiver using aString as standard input,
	or with no STDIN at all if aString is nil."

	| p |
	p := OSSUnixSubprocess new.
	p command: self bxCommandName.
	p arguments: self commandAndArguments.
	^ [ p redirectStdout.
	aString ifNotNil: [ p redirectStdin ].
	p run.
	aString
		ifNotNil: [ p stdinStream
				nextPutAll: aString;
				close ].
	p waitForExit.
	p stdoutStream upToEndOfFile trimBoth ]
		ensure: [ p closeAndCleanStreams ]