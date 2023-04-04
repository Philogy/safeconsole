# Foundry Safer Log

The [`safelog`](src/safelog.sol) library provides a foundry/hardhat like console logging interface whereby
the individual `log` functions **do not** modify the state of memory. This is important for
debugging low-level assembly that may touch on and rely on the free memory pointer and the
consistent state of memory beyond the free memory pointer. To ensure that the Solidity compiler does
not allocate any memory unexpectedly the `safelog.log` functions accept `bytes32` arguments instead
of `string`s as they are kept on the stack. This means that the string part of log messages will
have to be resricted to 32-character chunks.


## Installation

### Foundry

1. Install the library

```
forge install philogy/forge-safe-log --no-commit
```

2. Just import the lib and use:

**Example:**
```solidity
import {safelog} from "forge-safe-log/safelog.sol";

// Some example uses
safelog.log("My number: %d", 34);
safelog.log("Caller: %s", msg.sender);
safelog.log("Where in loop %d-%d", i, j);
```

### Hardhat

1. Install Foundry (I mean come on it's 2023)
2. Check Foundry installation instructions

### Truffle

Lmao ngmi. (Jk just install Hardhat and then check Hardhat installation instructions)

## Caveats
- `safelog.log` functions **may** increase `msize` if `msize < 0x1a0`
- `safelog.log` will treat all `bytes32` arguments as strings and truncate them at their first `0x00`-byte (.e.g `hex"6162630064"` will result in the string `"abc"` of length 3)
