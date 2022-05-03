from blspy import PrivateKey, AugSchemeMPL

from chia.util.hash import std_hash

from clvm.casts import int_to_bytes

SK: PrivateKey = PrivateKey.from_bytes(bytes.fromhex("680aeab7da8d9885e8fedfde1fbe6bc6d0b88a131829d9238898909d06899225"))
COIN_ID: bytes = bytes.fromhex("7d421ef3019e3503d039897a2a58db6f7e2ccd4dc1a2eb3ebc47c09a26d13618")
NEW_AMOUNT: bytes = int_to_bytes(100)

signature = AugSchemeMPL.sign(SK, std_hash(COIN_ID + NEW_AMOUNT))

print(str(COIN_ID))
print(str(signature))