commands-creation
newCommand: aString input: anObject

	anObject ifNil: [ self error: ('Input for <1p> not provided' expandMacrosWith: aString)].
	^(BXCommand command: aString input: anObject)