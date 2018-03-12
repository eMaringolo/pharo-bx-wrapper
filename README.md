# pharo-bx-wrapper
Wrapper methods to execute [libbitcoin's bx command line utility](https://github.com/libbitcoin/libbitcoin-explorer/wiki)
as regular Pharo expressions.

## About Bitcoin Explorer (bx)

BX is a general purpose Bitcoin command line utility that supports Linux, OSX and Windows.
The application can be built an distributed as a single file binary with no run time
dependencies apart from the operating system.

## Installation

```smalltalk
Metacello new 
  baseline: 'BXWrapper'; 
  repository: 'github://eMaringolo/pharo-bx-wrapper/src'; 
  load.
```

Please note that the `bx` executable must be included in `$PATH` and its binary is not provided by this package. You can download it at https://github.com/libbitcoin/libbitcoin-explorer/wiki/Download-BX.


## About this wrapper

This wrapper is built with the objective of being able to run `bx` from within the comfort of the Pharo image.

It uses [OSSubprocess](https://github.com/marianopeck/OSSubprocess/) extensively to invoke the external `bx` commands. 
Since this is a work in progress, it's been tested in Linux only, so only `OSSUnixSubprocess` is implemented.


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
bx seed
 "'b0903233d630b2e5bb67a64f906819c914ea2612d63131ee'"
```


### Chaining commands

To run the equivalent of:
```shell
$ bx seed | bx ec-new | bx ec-to-public | bx ec-to-address
```

You evaluate:
```smalltalk
bx := BXBitcoinExplorer new.
(bx ecToAddress: (bx ecToPublic: (bx ecNew: bx seed))).
"'18FXUKxphFdd166nqNwt35uXCxAoFZC79q'"
```

