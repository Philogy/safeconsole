// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @author philogy <https://github.com/philogy>
/// @dev Code generated automatically by script.
library safelog {
    uint256 constant CONSOLE_ADDR = 0x000000000000000000000000000000000000000000636F6e736F6c652e6c6f67;

    function length(bytes32 w) internal pure returns (uint256 len) {
        for (; len < 32;) {
            if (w[len] == hex"00") break;
            unchecked {
                len++;
            }
        }
    }

    function log(address p0) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x24, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x81) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x24, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x81) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x24, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x81) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bytes32 p0) internal view {
        address console = CONSOLE;
        uint256 l0 = length(p0);
        uint32 selector = uint32(uint256(keccak256("log(string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), 0x20)
            mstore(add(freeMem, 0x40), l0)
            mstore(add(freeMem, 0x60), p0)
            mstore(add(freeMem, add(0x60, l0)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x24, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x81) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x44, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xa1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x44, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xa1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, uint256 p1) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x44, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xa1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bytes32 p1) internal view {
        address console = CONSOLE;
        uint256 l1 = length(p1);
        uint32 selector = uint32(uint256(keccak256("log(address,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), 0x40)
            mstore(add(freeMem, 0x60), l1)
            mstore(add(freeMem, 0x80), p1)
            mstore(add(freeMem, add(0x80, l1)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x44, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xa1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool,bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x44, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xa1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, uint256 p1) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x44, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xa1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bytes32 p1) internal view {
        address console = CONSOLE;
        uint256 l1 = length(p1);
        uint32 selector = uint32(uint256(keccak256("log(bool,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), 0x40)
            mstore(add(freeMem, 0x60), l1)
            mstore(add(freeMem, 0x80), p1)
            mstore(add(freeMem, add(0x80, l1)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x44, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xa1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0, uint256 p1) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x44, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xa1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0, bytes32 p1) internal view {
        address console = CONSOLE;
        uint256 l1 = length(p1);
        uint32 selector = uint32(uint256(keccak256("log(uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), 0x40)
            mstore(add(freeMem, 0x60), l1)
            mstore(add(freeMem, 0x80), p1)
            mstore(add(freeMem, add(0x80, l1)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x44, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xa1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bytes32 p0, bytes32 p1) internal view {
        address console = CONSOLE;
        uint256 l0 = length(p0);
        uint256 l1 = length(p1);
        uint32 selector = uint32(uint256(keccak256("log(string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), 0x40)
            mstore(add(freeMem, 0x40), 0x80)
            mstore(add(freeMem, 0x60), l0)
            mstore(add(freeMem, 0x80), p0)
            mstore(add(freeMem, add(0x80, l0)), 0)
            mstore(add(freeMem, 0xa0), l1)
            mstore(add(freeMem, 0xc0), p1)
            mstore(add(freeMem, add(0xc0, l1)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, address p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address,address)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, bool p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address,bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, uint256 p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(address,address,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x60)
            mstore(add(freeMem, 0x80), l2)
            mstore(add(freeMem, 0xa0), p2)
            mstore(add(freeMem, add(0xa0, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1, bool p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,bool,bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1, uint256 p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,bool,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(address,bool,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x60)
            mstore(add(freeMem, 0x80), l2)
            mstore(add(freeMem, 0xa0), p2)
            mstore(add(freeMem, add(0xa0, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, uint256 p1, uint256 p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, uint256 p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(address,uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x60)
            mstore(add(freeMem, 0x80), l2)
            mstore(add(freeMem, 0xa0), p2)
            mstore(add(freeMem, add(0xa0, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bytes32 p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l1 = length(p1);
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(address,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), 0x60)
            mstore(add(freeMem, 0x60), 0xa0)
            mstore(add(freeMem, 0x80), l1)
            mstore(add(freeMem, 0xa0), p1)
            mstore(add(freeMem, add(0xa0, l1)), 0)
            mstore(add(freeMem, 0xc0), l2)
            mstore(add(freeMem, 0xe0), p2)
            mstore(add(freeMem, add(0xe0, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xa4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x101) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1, bool p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool,bool,bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1, uint256 p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool,bool,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(bool,bool,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x60)
            mstore(add(freeMem, 0x80), l2)
            mstore(add(freeMem, 0xa0), p2)
            mstore(add(freeMem, add(0xa0, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, uint256 p1, uint256 p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool,uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, uint256 p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(bool,uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x60)
            mstore(add(freeMem, 0x80), l2)
            mstore(add(freeMem, 0xa0), p2)
            mstore(add(freeMem, add(0xa0, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bytes32 p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l1 = length(p1);
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(bool,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), 0x60)
            mstore(add(freeMem, 0x60), 0xa0)
            mstore(add(freeMem, 0x80), l1)
            mstore(add(freeMem, 0xa0), p1)
            mstore(add(freeMem, add(0xa0, l1)), 0)
            mstore(add(freeMem, 0xc0), l2)
            mstore(add(freeMem, 0xe0), p2)
            mstore(add(freeMem, add(0xe0, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xa4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x101) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0, uint256 p1, uint256 p2) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(uint256,uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0, uint256 p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(uint256,uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x60)
            mstore(add(freeMem, 0x80), l2)
            mstore(add(freeMem, 0xa0), p2)
            mstore(add(freeMem, add(0xa0, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x64, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xc1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0, bytes32 p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l1 = length(p1);
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(uint256,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), 0x60)
            mstore(add(freeMem, 0x60), 0xa0)
            mstore(add(freeMem, 0x80), l1)
            mstore(add(freeMem, 0xa0), p1)
            mstore(add(freeMem, add(0xa0, l1)), 0)
            mstore(add(freeMem, 0xc0), l2)
            mstore(add(freeMem, 0xe0), p2)
            mstore(add(freeMem, add(0xe0, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xa4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x101) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bytes32 p0, bytes32 p1, bytes32 p2) internal view {
        address console = CONSOLE;
        uint256 l0 = length(p0);
        uint256 l1 = length(p1);
        uint256 l2 = length(p2);
        uint32 selector = uint32(uint256(keccak256("log(string,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), 0x60)
            mstore(add(freeMem, 0x40), 0xa0)
            mstore(add(freeMem, 0x60), 0xe0)
            mstore(add(freeMem, 0x80), l0)
            mstore(add(freeMem, 0xa0), p0)
            mstore(add(freeMem, add(0xa0, l0)), 0)
            mstore(add(freeMem, 0xc0), l1)
            mstore(add(freeMem, 0xe0), p1)
            mstore(add(freeMem, add(0xe0, l1)), 0)
            mstore(add(freeMem, 0x100), l2)
            mstore(add(freeMem, 0x120), p2)
            mstore(add(freeMem, add(0x120, l2)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xe4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x141) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, address p2, address p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address,address,address)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, address p2, bool p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address,address,bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, address p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address,address,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, address p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,address,address,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, bool p2, bool p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address,bool,bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, bool p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address,bool,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, bool p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,address,bool,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, uint256 p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,address,uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, uint256 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,address,uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, address p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,address,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x80)
            mstore(add(freeMem, 0x80), 0xc0)
            mstore(add(freeMem, 0xa0), l2)
            mstore(add(freeMem, 0xc0), p2)
            mstore(add(freeMem, add(0xc0, l2)), 0)
            mstore(add(freeMem, 0xe0), l3)
            mstore(add(freeMem, 0x100), p3)
            mstore(add(freeMem, add(0x100, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xc4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x121) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1, bool p2, bool p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,bool,bool,bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1, bool p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,bool,bool,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1, bool p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,bool,bool,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1, uint256 p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,bool,uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1, uint256 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,bool,uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bool p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,bool,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x80)
            mstore(add(freeMem, 0x80), 0xc0)
            mstore(add(freeMem, 0xa0), l2)
            mstore(add(freeMem, 0xc0), p2)
            mstore(add(freeMem, add(0xc0, l2)), 0)
            mstore(add(freeMem, 0xe0), l3)
            mstore(add(freeMem, 0x100), p3)
            mstore(add(freeMem, add(0x100, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xc4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x121) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, uint256 p1, uint256 p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(address,uint256,uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, uint256 p1, uint256 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,uint256,uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, uint256 p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,uint256,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x80)
            mstore(add(freeMem, 0x80), 0xc0)
            mstore(add(freeMem, 0xa0), l2)
            mstore(add(freeMem, 0xc0), p2)
            mstore(add(freeMem, add(0xc0, l2)), 0)
            mstore(add(freeMem, 0xe0), l3)
            mstore(add(freeMem, 0x100), p3)
            mstore(add(freeMem, add(0x100, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xc4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x121) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(address p0, bytes32 p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l1 = length(p1);
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(address,string,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), 0x80)
            mstore(add(freeMem, 0x60), 0xc0)
            mstore(add(freeMem, 0x80), 0x100)
            mstore(add(freeMem, 0xa0), l1)
            mstore(add(freeMem, 0xc0), p1)
            mstore(add(freeMem, add(0xc0, l1)), 0)
            mstore(add(freeMem, 0xe0), l2)
            mstore(add(freeMem, 0x100), p2)
            mstore(add(freeMem, add(0x100, l2)), 0)
            mstore(add(freeMem, 0x120), l3)
            mstore(add(freeMem, 0x140), p3)
            mstore(add(freeMem, add(0x140, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x104, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x161) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1, bool p2, bool p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool,bool,bool,bool)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1, bool p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool,bool,bool,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1, bool p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(bool,bool,bool,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1, uint256 p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool,bool,uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1, uint256 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(bool,bool,uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bool p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(bool,bool,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x80)
            mstore(add(freeMem, 0x80), 0xc0)
            mstore(add(freeMem, 0xa0), l2)
            mstore(add(freeMem, 0xc0), p2)
            mstore(add(freeMem, add(0xc0, l2)), 0)
            mstore(add(freeMem, 0xe0), l3)
            mstore(add(freeMem, 0x100), p3)
            mstore(add(freeMem, add(0x100, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xc4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x121) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, uint256 p1, uint256 p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(bool,uint256,uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, uint256 p1, uint256 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(bool,uint256,uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, uint256 p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(bool,uint256,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x80)
            mstore(add(freeMem, 0x80), 0xc0)
            mstore(add(freeMem, 0xa0), l2)
            mstore(add(freeMem, 0xc0), p2)
            mstore(add(freeMem, add(0xc0, l2)), 0)
            mstore(add(freeMem, 0xe0), l3)
            mstore(add(freeMem, 0x100), p3)
            mstore(add(freeMem, add(0x100, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xc4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x121) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bool p0, bytes32 p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l1 = length(p1);
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(bool,string,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), 0x80)
            mstore(add(freeMem, 0x60), 0xc0)
            mstore(add(freeMem, 0x80), 0x100)
            mstore(add(freeMem, 0xa0), l1)
            mstore(add(freeMem, 0xc0), p1)
            mstore(add(freeMem, add(0xc0, l1)), 0)
            mstore(add(freeMem, 0xe0), l2)
            mstore(add(freeMem, 0x100), p2)
            mstore(add(freeMem, add(0x100, l2)), 0)
            mstore(add(freeMem, 0x120), l3)
            mstore(add(freeMem, 0x140), p3)
            mstore(add(freeMem, add(0x140, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x104, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x161) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0, uint256 p1, uint256 p2, uint256 p3) internal view {
        address console = CONSOLE;
        uint32 selector = uint32(uint256(keccak256("log(uint256,uint256,uint256,uint256)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), p3)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0, uint256 p1, uint256 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(uint256,uint256,uint256,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), p2)
            mstore(add(freeMem, 0x80), 0x80)
            mstore(add(freeMem, 0xa0), l3)
            mstore(add(freeMem, 0xc0), p3)
            mstore(add(freeMem, add(0xc0, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x84, 0x0, 0x0))
            for { let i := 0 } lt(i, 0xe1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0, uint256 p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(uint256,uint256,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), p1)
            mstore(add(freeMem, 0x60), 0x80)
            mstore(add(freeMem, 0x80), 0xc0)
            mstore(add(freeMem, 0xa0), l2)
            mstore(add(freeMem, 0xc0), p2)
            mstore(add(freeMem, add(0xc0, l2)), 0)
            mstore(add(freeMem, 0xe0), l3)
            mstore(add(freeMem, 0x100), p3)
            mstore(add(freeMem, add(0x100, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0xc4, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x121) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(uint256 p0, bytes32 p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l1 = length(p1);
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(uint256,string,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), p0)
            mstore(add(freeMem, 0x40), 0x80)
            mstore(add(freeMem, 0x60), 0xc0)
            mstore(add(freeMem, 0x80), 0x100)
            mstore(add(freeMem, 0xa0), l1)
            mstore(add(freeMem, 0xc0), p1)
            mstore(add(freeMem, add(0xc0, l1)), 0)
            mstore(add(freeMem, 0xe0), l2)
            mstore(add(freeMem, 0x100), p2)
            mstore(add(freeMem, add(0x100, l2)), 0)
            mstore(add(freeMem, 0x120), l3)
            mstore(add(freeMem, 0x140), p3)
            mstore(add(freeMem, add(0x140, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x104, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x161) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }

    function log(bytes32 p0, bytes32 p1, bytes32 p2, bytes32 p3) internal view {
        address console = CONSOLE;
        uint256 l0 = length(p0);
        uint256 l1 = length(p1);
        uint256 l2 = length(p2);
        uint256 l3 = length(p3);
        uint32 selector = uint32(uint256(keccak256("log(string,string,string,string)")) >> 224);
        assembly {
            let freeMem := msize()
            mstore(freeMem, selector)
            mstore(add(freeMem, 0x20), 0x80)
            mstore(add(freeMem, 0x40), 0xc0)
            mstore(add(freeMem, 0x60), 0x100)
            mstore(add(freeMem, 0x80), 0x140)
            mstore(add(freeMem, 0xa0), l0)
            mstore(add(freeMem, 0xc0), p0)
            mstore(add(freeMem, add(0xc0, l0)), 0)
            mstore(add(freeMem, 0xe0), l1)
            mstore(add(freeMem, 0x100), p1)
            mstore(add(freeMem, add(0x100, l1)), 0)
            mstore(add(freeMem, 0x120), l2)
            mstore(add(freeMem, 0x140), p2)
            mstore(add(freeMem, add(0x140, l2)), 0)
            mstore(add(freeMem, 0x160), l3)
            mstore(add(freeMem, 0x180), p3)
            mstore(add(freeMem, add(0x180, l3)), 0)
            pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x144, 0x0, 0x0))
            for { let i := 0 } lt(i, 0x1a1) { i := add(i, 0x20) } { mstore(add(freeMem, i), 0) }
        }
    }
}
