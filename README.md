# Foundry Safer Log

The [`safelog`](src/safelog.sol) provides a foundry/hardhat like console logging interface whereby
the individual `log` functions **do not** modify the state of memory. This is important for
debugging low-level assembly that may touch on and rely on the free memory pointer and the
consistent state of memory beyond the free memory pointer. To ensure that the Solidity compiler does
not allocate any memory unexpectedly the `safelog.log` functions accept `bytes32` arguments instead
of `strings` as they are kept on the stack. This means that the string part of log messages will
have to be resricted to 32-character chunks.

**Example:**
```solidity
import {safelog} from "forge-safe-log/safelog.sol";

// Your function
safelog.log("My number: %d", 34);
```

## Caveats
- `safelog.log` functions **may** increase `msize` if `msize < 0x1a0`
- `safelog.log` will treat all `bytes32` arguments as strings and truncate them at their first `0x00`-byte (.e.g `hex"6162630064"` will result in the string `"abc"` of length 3)
