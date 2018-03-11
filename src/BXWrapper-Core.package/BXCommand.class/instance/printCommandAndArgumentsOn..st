printing
printCommandAndArgumentsOn: aStream
	aStream
		nextPutAll: 'bx';
		space;
		nextPutAll: self command