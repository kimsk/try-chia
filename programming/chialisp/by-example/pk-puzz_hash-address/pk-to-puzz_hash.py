# First wallet address: txch1nchyk8kax2awmuh0ckleuslsm9wvwydpe0jvwvzx62aae6xqnuzs0hzeea
# First wallet secret key (m/12381/8444/2/0): <PrivateKey 5acf5ef55caff570b74bb1335c93f6646d8c2004a4fabdb5122398a2df41cfdb>

from blspy import (PrivateKey, AugSchemeMPL, G1Element, G2Element)
from chia.util.bech32m import decode_puzzle_hash, encode_puzzle_hash
from chia.wallet.puzzles.p2_delegated_puzzle_or_hidden_puzzle import (
    DEFAULT_HIDDEN_PUZZLE_HASH, 
    calculate_synthetic_secret_key, 
    puzzle_for_public_key_and_hidden_puzzle_hash
)

sk: PrivateKey = PrivateKey.from_bytes(bytes.fromhex("5acf5ef55caff570b74bb1335c93f6646d8c2004a4fabdb5122398a2df41cfdb"))
pk: G1Element = sk.get_g1()

puzzle = puzzle_for_public_key_and_hidden_puzzle_hash(
    pk, DEFAULT_HIDDEN_PUZZLE_HASH
)

puzz_hash = puzzle.get_tree_hash()
address = encode_puzzle_hash(puzz_hash, prefix="txch")
assert address == "txch1nchyk8kax2awmuh0ckleuslsm9wvwydpe0jvwvzx62aae6xqnuzs0hzeea"

print(f'pk:\t\t{pk}')
print(f'puzz_hash:\t{puzz_hash}')
print(f'address:\t{address}')
