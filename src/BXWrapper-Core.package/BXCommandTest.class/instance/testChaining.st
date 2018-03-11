tests
testChaining

	| cmd1 cmd2 cmd3 chain |
	cmd1 := BXCommand command: 'seed'.
	cmd2 := BXCommand command: 'ec-new'.
	cmd3 := BXCommand command: 'ec-to-public'.
	chain := cmd1, cmd2, cmd3.

	self assert: chain next command equals: cmd2 command.
	self assert: chain last equals: cmd3.