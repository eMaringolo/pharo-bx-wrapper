I represent a sequence of commands executed one after the other, where output of one is the input of the next via system pipes.

Internally all the calls are executed at once as a single call running  a shell command, this way we only provide a single input for the first command, and get a single output from the last one.