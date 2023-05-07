from collections import namedtuple
import os
from Crypto.Hash import keccak


def keccak256(preimage: bytes) -> bytes:
    hasher = keccak.new(digest_bits=256)
    hasher.update(preimage)
    return hasher.digest()


StringMstore = namedtuple('StringMstore', ['offset', 'i'])

accepted_types = ['address', 'bool', 'uint256', 'string']

MAX_ARG_COUNT = 4

funcs = []

INDENT = 4


def ind(n):
    return ' ' * (INDENT * n)


def indent(s, n):
    d = ind(n)
    return d + s.replace('\n', f'\n{d}', s.count('\n') - 1)


def line(s: str, n: int) -> str:
    return f'{ind(n)}{s}\n'


WRITE_STRING_FN = '''function writeString(pos, w) {
    let length := 0
    for { } lt(length, 0x20) { length := add(length, 1) } {
        if iszero(byte(length, w)) { break }
    }
    mstore(pos, length)
    let shift := sub(256, shl(3, length))
    mstore(add(pos, 0x20), shl(shift, shr(shift, w)))
}
'''
total = 0


def combs(values, size):
    if size == 1:
        for x in values:
            yield (x,)
    elif size >= 2:
        for x in values:
            for sub_comb in combs(values, size-1):
                yield (x,) + sub_comb


for arg_count in range(1, MAX_ARG_COUNT + 1):
    for sig_args in combs(accepted_types, arg_count):
        total += 1
        log_args = []
        str_offset = arg_count * 0x20
        strings = []
        params = []
        total_words = 1 + len(sig_args)
        for i, arg_type in enumerate(sig_args):
            offset = f'0x{0x20 + i * 0x20:02x}'
            if arg_type == 'string':
                strings.append(StringMstore(str_offset, i))
                params.append(f'mstore({offset}, 0x{str_offset:02x})\n')
                str_offset += 0x40
                log_args.append(f'bytes32 p{i}')
                total_words += 2
            else:
                params.append(f'mstore({offset}, p{i})\n')
                log_args.append(f'{arg_type} p{i}')

        mem_var_defs = indent(
            ''.join(
                f'bytes32 m{i};\n'
                for i in range(total_words)
            ), 2)

        mem_preserve = indent(
            ''.join(
                f'm{i} := mload(0x{0x20 * i:02x})\n'
                for i in range(total_words)
            ), 2)
        sig = f'log({",".join(sig_args)})'
        selector = keccak256(sig.encode())[:4].hex()
        param_writes = indent(
            f'// Selector of `{sig}`.\nmstore(0x00, 0x{selector})\n'
            + ''.join(params),
            2
        )
        str_writes = indent(
            ''.join(
                f'writeString(0x{base_offset + 0x20:02x}, p{i})\n'
                for base_offset, i in strings
            ),
            2
        )
        mem_restores = indent(
            ''.join(
                f'mstore(0x{0x20 * i:02x}, m{i})\n'
                for i in range(total_words)
            ),
            2
        )

        data_length = 0x04 + str_offset

        funcs.append(
            indent(
                f'''function log({", ".join(log_args)}) internal pure {{
{mem_var_defs}\
    assembly {{
{indent(WRITE_STRING_FN, 2) if strings else ""}\
{mem_preserve}\
{param_writes}\
{str_writes}\
    }}
    _getLog()(0x{data_length:02x});
    assembly {{
{mem_restores}\
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
    uint256 constant CONSOLE_ADDR = 0x000000000000000000000000000000000000000000636F6e736F6c652e6c6f67;

    function _viewCallLog(uint256 psize) private view {{
        assembly {{
            pop(staticcall(gas(), CONSOLE_ADDR, 0x1c, psize, 0x0, 0x0))
        }}
    }}

    // Credit to [0age](https://twitter.com/z0age/status/1654922202930888704) and [0xdapper](https://github.com/foundry-rs/forge-std/pull/374)
    // for the view-to-pure log trick.
    function _getLog() private pure returns(function(uint256) internal pure logFn) {{
        function(uint256) internal view viewLog = _viewCallLog;
        assembly {{
            logFn := viewLog
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

print(f'total functions: {total}')
print(f'Console code written to {normed_fp}')
