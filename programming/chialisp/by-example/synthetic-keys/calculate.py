from chia.wallet.puzzles.p2_delegated_puzzle_or_hidden_puzzle import (
    DEFAULT_HIDDEN_PUZZLE_HASH, 
    calculate_synthetic_secret_key, 
    puzzle_for_public_key_and_hidden_puzzle_hash,
    calculate_synthetic_public_key
)
from blspy import (PrivateKey, AugSchemeMPL, G1Element)

pk: G1Element = G1Element.from_bytes(
    bytes.fromhex("a4d7da9a1c5210352e4487abc45cc09ca7e523630740e208087c4eb5f0c7ea85819c7affae1b1c846feabf49b071ad1d")
)

syn_pk = calculate_synthetic_public_key(pk, DEFAULT_HIDDEN_PUZZLE_HASH)

print(f'DEFAULT_HIDDEN_PUZZLE_HASH:\t{DEFAULT_HIDDEN_PUZZLE_HASH}')
print(f'public key:\t\t\t{pk}')
print(f'synthetic_public_key:\t\t{syn_pk}')

# ❯ cdv inspect keys --synthetic --public-key a4d7da9a1c5210352e4487abc45cc09ca7e523630740e208087c4eb5f0c7ea85819c7affae1b1c846feabf49b071ad1d --hidden-puzhash 711d6c4e32c92e53179b199484cf8c897542bc57f2b22582799f9
# d657eec4699
# Public Key: ab29ecd3b1425ee081a371ac4b819fd0b1f94de7517cb51937e268e1ebda958ce19bf0b7d3eebbf26ba9c5283f7df6a5
# Fingerprint: 2432166656
# HD Path: m
