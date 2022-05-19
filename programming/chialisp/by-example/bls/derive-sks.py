from blspy import (PrivateKey)
from chia.util.ints import uint32
from chia.wallet import derive_keys

master_sk: PrivateKey = PrivateKey.from_bytes(bytes.fromhex("2a672d44d88a09f0a31b9bc3e2de344d67a376cb9a9e2179c580895cc1127062"))

# non-observer or hardened key
print(derive_keys.master_sk_to_wallet_sk(master_sk, uint32(0)))

# observer or unhardened keys
for i in range(3):
    wallet_sk = derive_keys.master_sk_to_wallet_sk_unhardened(master_sk, uint32(i))
    print(wallet_sk)

# ❯ python ./derive-sks.py
# <PrivateKey 309b626c696d3af174483bb74c1751e54fd89518bb03ede22f92627bb0e35e06>
# <PrivateKey 55735f11aac108a60037bc7e534410c622f86d987724ed8a4d1a91d777d41187>
# <PrivateKey 0ddd3bb391a1d85b42e6611e96d117eb3c2ceaad8b8a0a63d83941ac715e47dc>
# <PrivateKey 1257f313b3ee14115a713e2e8874378c6f7b5b6e9e58348e305bb79a10ae9e03>