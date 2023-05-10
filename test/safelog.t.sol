// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {safelog} from "src/safelog.sol";

/// @author philogy <https://github.com/philogy>
contract safelogTest is Test {
    uint256 internal constant MASK = 0x0101010101010101010101010101010101010101010101010101010101010101;

    function testLog() public {
        uint256[] memory wordsBefore = new uint[](32);
        for (uint256 i; i < wordsBefore.length; i++) {
            uint256 word;
            assembly {
                word := mload(mul(i, 0x20))
            }
            wordsBefore[i] = word;
        }
        safelog.log("hello (%s)", 30);
        for (uint256 i; i < wordsBefore.length; i++) {
            uint256 word;
            assembly {
                word := mload(mul(i, 0x20))
            }
            assertEq(wordsBefore[i], word);
        }
    }

    function testMemoryLog() public {
        for (uint256 i = 0; i < 256; i++) {
            assembly {
                mstore(shl(5, i), mul(MASK, i))
            }
        }
        safelog.logMemory(0x42, 123);
        for (uint256 i = 0; i < 256; i++) {
            uint256 expectedWord = MASK * i;
            uint256 word;
            assembly {
                word := mload(shl(5, i))
            }
            assertEq(word, expectedWord);
        }
    }
}
