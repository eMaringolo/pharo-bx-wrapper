instance creation
command: aString input: inputString
	^ self new
		setCommand: aString;
		input: inputString;
		yourself