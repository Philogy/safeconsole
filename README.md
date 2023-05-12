# Foundry Memory-Preserving Logging Library

The [`safeconsole`](src/safeconsole.sol) library provides a foundry/hardhat-like console logging interface whereby
the individual `log` functions **do not** modify the state of memory. This is important for
debugging low-level assembly that may touch on and rely on the free memory pointer and the
consistent state of memory beyond the free memory pointer. To ensure that the Solidity compiler does
not allocate any memory unexpectedly the `safeconsole.log` functions accept `bytes32` arguments instead
of `string`s as they are kept on the stack. This means that the string part of log messages will
have to be resricted to 32-character chunks.


## Installation

### Foundry

1. Install the library

```
forge install philogy/safeconsole --no-commit
```

2. Just import the lib and use:

**Example:**
```solidity
import {safeconsole} from "safeconsole/safeconsole.sol";

// Some example uses
safeconsole.log("My number: %d", 34);
safeconsole.log("Caller: %s", msg.sender);
safeconsole.log("Where in loop %d-%d", i, j);
```

### Hardhat

1. Install Foundry (I mean come on it's 2023)
2. Check Foundry installation instructions

### Truffle

Lmao ngmi. (Jk just install Hardhat and then check Hardhat installation instructions)

## Caveats
- certain `safeconsole.log` functions will increase `msize`, no function will modify `msize` if it's
  already larger than `0x1a0`
- `safeconsole.log` will treat all `bytes32` arguments as strings and truncate them at their first `0x00`-byte (.e.g `hex"6162630064"` will result in the string `"abc"` of length 3)
- `safeconsole.logMemory` will increase `msize` if the `offset` argument is below `0x60`
