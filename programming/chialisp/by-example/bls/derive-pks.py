import pprint
from typing import List

from blspy import (AugSchemeMPL, G1Element)
from chia.util import bech32m
from chia.wallet.puzzles import (p2_delegated_puzzle_or_hidden_puzzle)

wallet_HD_path = [12381, 8444, 2]


def pk_derive_path_unhardened(pk: G1Element, path: List[int]) -> G1Element:
    for index in path:
        pk = AugSchemeMPL.derive_child_pk_unhardened(pk, index)
    return pk

def get_observer_keys(pk: G1Element, path: List[int],  n: int):
    child_pks = []
    for i in range(0, n):
        child_pk = pk_derive_path_unhardened(pk, path + [i])
        child_pks.append(child_pk)
    return child_pks

def get_wallet_addresses(pk: G1Element,  n: int):
    wallet_addresses = []
    child_pks = get_observer_keys(pk, wallet_HD_path, n)
    for pk in child_pks:
        puzzle_hash = p2_delegated_puzzle_or_hidden_puzzle.puzzle_for_pk(pk).get_tree_hash()
        txch = bech32m.encode_puzzle_hash(puzzle_hash, prefix="txch")
        wallet_addresses.append(txch)
    return wallet_addresses

# Fingerprint: 4293720451
# Master public key (m): 8fe776afa643f3f1e6f5449bb7cfb1b82f7b594c4ebffba739a73b2d035feb1d6dc46b51ceb84b0f2fc59ddecfcb4b03
master_public_key: G1Element = G1Element.from_bytes(
    bytes.fromhex("8fe776afa643f3f1e6f5449bb7cfb1b82f7b594c4ebffba739a73b2d035feb1d6dc46b51ceb84b0f2fc59ddecfcb4b03")
)

pks = get_observer_keys(master_public_key, wallet_HD_path, 5)
print(pks)

wallet_addresses = get_wallet_addresses(master_public_key, 5)
pprint.pprint(wallet_addresses)