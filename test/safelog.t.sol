// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {safelog} from "src/safelog.sol";

/// @author philogy <https://github.com/philogy>
contract safelogTest is Test {
    function setUp() public {}

    function testFindsLength(string memory str) public {
        uint256 len = bytes(str).length;
        vm.assume(len <= 0x20);
        for (uint256 i; i < len; i++) {
            vm.assume(bytes(str)[i] != hex"00");
        }
        assertEq(len, safelog.length(bytes32(bytes(str))));
    }

    function testEmptyLength() public {
        assertEq(safelog.length(bytes32(0)), 0);
    }

    function testEarlyLengthCutoff() public {
        assertEq(safelog.length(bytes32(hex"1122334400ffffffffffffffffffffffffffffffffffffffffffffffffffffff")), 4);
    }
}
