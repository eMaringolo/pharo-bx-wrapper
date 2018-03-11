printing
printCommandChainOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' | '.
	self next printOn: aStream