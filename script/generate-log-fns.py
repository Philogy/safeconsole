from collections import namedtuple
from itertools import combinations_with_replacement
import os


StringMstore = namedtuple('StringMstore', ['offset', 'i'])

accepted_types = ['address', 'bool', 'uint256', 'string']

MAX_ARG_COUNT = 4

funcs = []

INDENT = 4


def ind(n):
    return ' ' * (INDENT * n)


def indent(s, n):
    return s.replace('\n', f'\n{ind(n)}').rstrip()


def line(s: str, n: int) -> str:
    return f'{ind(n)}{s}\n'


for arg_count in range(1, MAX_ARG_COUNT + 1):
    for sig_args in combinations_with_replacement(accepted_types, arg_count):
        log_args = []
        str_offset = arg_count * 0x20
        length_gets = ''
        mstores = ''
        strings = []
        for i, arg_type in enumerate(sig_args):
            offset = (i + 1) * 0x20
            mstores += f'{ind(2)}mstore(add(freeMem, 0x{offset:x}), '
            if arg_type == 'string':
                length_gets += f'{ind(1)}uint256 l{i} = length(p{i});\n'
                mstores += f'0x{str_offset:x}'
                strings.append(StringMstore(str_offset, i))
                str_offset += 0x40
                log_args.append(f'bytes32 p{i}')
            else:
                mstores += f'p{i}'
                log_args.append(f'{arg_type} p{i}')
            mstores += ')\n'
        for str_offset, i in strings:
            mstores += line(
                f'mstore(add(freeMem, 0x{str_offset+0x20:x}), l{i})',
                2
            )
            mstores += line(
                f'mstore(add(freeMem, 0x{str_offset + 0x40:x}), p{i})',
                2
            )
            mstores += line(
                f'mstore(add(freeMem, add(0x{str_offset + 0x40:x}, l{i})), 0)',
                2
            )
        data_length = 0x04 + str_offset

        funcs.append(
            indent(
                f'''
function log({", ".join(log_args)}) internal view {{
    address console = CONSOLE;
{length_gets}\
    uint32 selector = uint32(uint256(keccak256("log({",".join(sig_args)})")) >> 224);
    assembly {{
        let freeMem := msize()
        mstore(freeMem, selector)
{mstores}\
        pop(staticcall(gas(), console, add(freeMem, 0x1c), 0x{data_length:x}, 0x0, 0x0))
        for {{ let i := 0 }} lt(i, 0x{str_offset + 0x61:x}) {{ i := add(i, 0x20) }} {{
            mstore(add(freeMem, i), 0)
        }}
    }}
}}
 ''', 1
            )
        )

LINE_BREAK = '\n'

safelog_code = f'''
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @author philogy <https://github.com/philogy>
/// @dev Code generated automatically by script.
library safelog {{
    address constant CONSOLE = address(0x000000000000000000636F6e736F6c652e6c6f67);

    function length(bytes32 w) internal pure returns (uint256 len) {{
        for (; len < 32;) {{
            if (w[len] == hex"00") break;
            unchecked {{
                len++;
            }}
        }}
    }}
{LINE_BREAK.join(funcs)}
}}
'''

script_dir = os.path.dirname(__file__)
fp = os.path.join(script_dir, '../src/safelog.sol')
normed_fp = os.path.normpath(fp)
with open(normed_fp, 'w') as f:
    f.write(safelog_code)

print(f'Console code written to {normed_fp}')
