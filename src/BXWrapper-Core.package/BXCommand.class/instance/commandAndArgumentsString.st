printing
commandAndArgumentsString
	^ String streamContents: [ :s | self printCommandAndArgumentsOn: s ]