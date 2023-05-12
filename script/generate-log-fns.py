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
    _sendLogPayload(0x1c, 0x{data_length:02x});
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
library safeconsole {{
    uint256 constant CONSOLE_ADDR = 0x000000000000000000000000000000000000000000636F6e736F6c652e6c6f67;

    // Credit to [0age](https://twitter.com/z0age/status/1654922202930888704) and [0xdapper](https://github.com/foundry-rs/forge-std/pull/374)
    // for the view-to-pure log trick.
    function _sendLogPayload(uint256 offset, uint256 size) private pure {{
        function(uint256, uint256) internal view fnIn = _sendLogPayloadView;
        function(uint256, uint256) internal pure pureSendLogPayload;
        assembly {{
            pureSendLogPayload := fnIn
        }}
        pureSendLogPayload(offset, size);
    }}

    function _sendLogPayloadView(uint256 offset, uint256 size) private view {{
        assembly {{
            pop(staticcall(gas(), CONSOLE_ADDR, offset, size, 0x0, 0x0))
        }}
    }}

    function _memcopy(uint256 fromOffset, uint256 toOffset, uint256 length) private pure {{
        function(uint256, uint256, uint256) internal view fnIn = _memcopyView;
        function(uint256, uint256, uint256) internal pure pureMemcopy;
        assembly {{
            pureMemcopy := fnIn
        }}
        pureMemcopy(fromOffset, toOffset, length);
    }}

    function _memcopyView(uint256 fromOffset, uint256 toOffset, uint256 length) private view {{
        assembly {{
            pop(staticcall(gas(), 0x4, fromOffset, length, toOffset, length))
        }}
    }}

    function logMemory(uint256 offset, uint256 length) internal pure {{
        if (offset >= 0x60) {{
            // Sufficient memory before slice to prepare call header.
            bytes32 m0;
            bytes32 m1;
            bytes32 m2;
            assembly {{
                m0 := mload(sub(offset, 0x60))
                m1 := mload(sub(offset, 0x40))
                m2 := mload(sub(offset, 0x20))
                // Selector of `logBytes(bytes)`.
                mstore(sub(offset, 0x60), 0xe17bf956)
                mstore(sub(offset, 0x40), 0x20)
                mstore(sub(offset, 0x20), length)
            }}
            _sendLogPayload(offset - 0x44, length + 0x44);
            assembly {{
                mstore(sub(offset, 0x60), m0)
                mstore(sub(offset, 0x40), m1)
                mstore(sub(offset, 0x20), m2)
            }}
        }} else {{
            // Insufficient space, so copy slice forward, add header and reverse.
            bytes32 m0;
            bytes32 m1;
            bytes32 m2;
            uint256 endOffset = offset + length;
            assembly {{
                m0 := mload(add(endOffset, 0x00))
                m1 := mload(add(endOffset, 0x20))
                m2 := mload(add(endOffset, 0x40))
            }}
            _memcopy(offset, offset + 0x60, length);
            assembly {{
                // Selector of `logBytes(bytes)`.
                mstore(add(offset, 0x00), 0xe17bf956)
                mstore(add(offset, 0x20), 0x20)
                mstore(add(offset, 0x40), length)
            }}
            _sendLogPayload(offset + 0x1c, length + 0x44);
            _memcopy(offset + 0x60, offset, length);
            assembly {{
                mstore(add(endOffset, 0x00), m0)
                mstore(add(endOffset, 0x20), m1)
                mstore(add(endOffset, 0x40), m2)
            }}
        }}
    }}


{LINE_BREAK.join(funcs)}
}}
'''

script_dir = os.path.dirname(__file__)
fp = os.path.join(script_dir, '../src/safeconsole.sol')
normed_fp = os.path.normpath(fp)
with open(normed_fp, 'w') as f:
    f.write(safelog_code)

print(f'total functions: {total}')
print(f'Console code written to {normed_fp}')
