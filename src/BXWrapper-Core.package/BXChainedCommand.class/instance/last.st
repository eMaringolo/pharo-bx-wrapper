accessing
last
	| last |
	last := self next.
	[ last isChained ] whileTrue: [ last := last next ].
	^ last