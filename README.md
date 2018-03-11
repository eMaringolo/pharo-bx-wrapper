# pharo-bx-wrapper
Wrapper methods to execute [libbitcoin's bx command line utility](https://github.com/libbitcoin/libbitcoin-explorer/wiki)
as regular Pharo expressions.


## About Bitcoin Explorer (bx)

BX is a general purpose Bitcoin command line utility that supports Linux, OSX and Windows.
The application can be built an distributed as a single file binary with no run time
dependencies apart from the operating system.

## About this wrapper

This wrapper is build with the objective of being able to run `bx` from the comfort of the Pharo image.

It is built using [OSSubprocess](https://github.com/marianopeck/OSSubprocess/) extensively to invoke the external `bx` commands. 
Since this is a work in progress, it's been tested in Linux only, so only `OSSUnixSubprocess` is implemented.

## BX Commands

BX commands are programmed in a way that most of its input can be passed by STDIN, and its STDOUT to another bx command.

## Pharo examples 

To work with bx, you instantiate a `BXBitcoinExplorer` that will work as a command repository, 
since it is stateless you can share the same instance to create different bx commands.

```smalltalk
| bx |
bx := BXBitcoinExplorer new.
```
Inspect or print the output for the following examples.

### Executing a single command

```smalltalk
bx seed run
 "'b0903233d630b2e5bb67a64f906819c914ea2612d63131ee'"
```

### Chaining commands
To avoid excessive command line calls, you can chain different methods that will be run using a single shell call.

So to run the equivalent of this command line:

```
$ bx seed | bx ec-new | bx ec-to-public | bx ec-to-address
```

You evaluate:

```smalltalk
(bx seed, bx ecNew, bx ecToPublic, bx ecToAddress) run.
  "'18FXUKxphFdd166nqNwt35uXCxAoFZC79q'"
```
For convenience you could also use `|` instead of `,` to create a chained command (but it is not very _smalltalkish_)
```smalltalk
(bx seed | bx ecNew | bx ecToPublic | bx ecToAddress) run.
```



### Passing text as standard input

To pass aString as the STDIN of the invoked command, you can do it by using `runWith: aString` instead of `run`.

```smalltalk
Passing a EC seed generated in Pharo.
(bx ecNew, bx ecToPublic, bx ecToAddress) runWith: BIP39Mnemonic generate seed
```

(The above example requires `BIP39Mnemonic` from https://github.com/eMaringolo/pharo-bip39mnemonic/)



