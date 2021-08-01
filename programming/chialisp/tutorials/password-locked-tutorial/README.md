- [How to spend a coin using an RPC call](https://chialisp.com/docs/tutorials/coin_spend_rpc)
- [Chialisp - Create and spend password protected coin from CLI](https://www.youtube.com/watch?v=NJydOPMLxBg)
- [How to secure coin with custom puzzle and spend it](https://www.reddit.com/r/Chialisp/comments/ogqtn2/how_to_secure_coin_with_custom_puzzle_and_spend_it/)

# get_coin_records_by_puzzle_hash 0x4843c869bba5f65aa1e806cd372dae5668ca3b69640d067e86837ca96b324e71
## Body
``` json
{
    "puzzle_hash": "0x4843c869bba5f65aa1e806cd372dae5668ca3b69640d067e86837ca96b324e71",
    "include_spent_coins": true
}
```

## Unspent Response
``` json
{
    "coin_records": [
        {
            "coin": {
                "amount": 100000,
                "parent_coin_info": "0x83057c6247ddb013f7e341df07d99f743c0d625ed3929e7cc308a21bd9caa450",
                "puzzle_hash": "0x4843c869bba5f65aa1e806cd372dae5668ca3b69640d067e86837ca96b324e71"
            },
            "coinbase": false,
            "confirmed_block_index": 627242,
            "spent": false,
            "spent_block_index": 0,
            "timestamp": 1627319769
        }
    ],
    "success": true
}
```

## Spent Response
``` json
{
    {},
    {
        "coin": {
            "amount": 100000,
            "parent_coin_info": "0x83057c6247ddb013f7e341df07d99f743c0d625ed3929e7cc308a21bd9caa450",
            "puzzle_hash": "0x4843c869bba5f65aa1e806cd372dae5668ca3b69640d067e86837ca96b324e71"
        },
        "coinbase": false,
        "confirmed_block_index": 627242,
        "spent": true,
        "spent_block_index": 629154,
        "timestamp": 1627319769
    },
}
```

# get_block_record_by_height, 
## Body
```json
{
    "height": 629154
}
```

## Response
```json
{
    "block_record": {
        "challenge_block_info_hash": "0x8e03ea6cd74240a7a2fcfcc4b326dc1a39140ccdf64fa39c294f115c03421d0f",
        "challenge_vdf_output": {
            "data": "0x0200f5867a02b73cc0643718bd5f20fbb66591c37be7f3ea4e853bf95109895c8d362043f782248280d350f1e75297b266192e25f213d166d8d0bc2d2cb75ad2d400138244f826bc45e24d3fc5488e1f376277fc1c5153ccbca3b44c7847a9c18a021006"
        },
        "deficit": 0,
        "farmer_puzzle_hash": "0x7c7eb668a2fe3c45fb8b28fcc00055cbfd995271b246489f2f80910b531823e1",
        "fees": 99999,
        "finished_challenge_slot_hashes": null,
        "finished_infused_challenge_slot_hashes": null,
        "finished_reward_slot_hashes": null,
        "header_hash": "0x4cf329418d3e547da59730c623156bc408dab1cb10b7482d2642afc39f6b4882",
        "height": 629154,
        "infused_challenge_vdf_output": {
            "data": "0x01002d2479c8cc3e36f5ce229872ed32552a202e066ab80a705e2b59f1da483e2290da0fbe8709e0f247f371ef6a2c0990e261de2f83f6ceba0616fb00f194009a0966845f06f9e4f4cf70856d9a7b053317b25676815491eed4b9ec0fd1ac81ae0a0803"
        },
        "overflow": false,
        "pool_puzzle_hash": "0x7c7eb668a2fe3c45fb8b28fcc00055cbfd995271b246489f2f80910b531823e1",
        "prev_hash": "0xa76a0e44968ad268771e9d12de749307bdb3e75065cdbb497b5203968e4ee532",
        "prev_transaction_block_hash": "0xa8cd6336137ae6f5ed8c590417c2e68e258eaf96820d635dbcc7b3b30cde2f98",
        "prev_transaction_block_height": 629151,
        "required_iters": 661708,
        "reward_claims_incorporated": [
            {
                "amount": 1750000000000,
                "parent_coin_info": "0xccd5bb71183532bff220ba46c268991a0000000000000000000000000009999f",
                "puzzle_hash": "0x15fa13b6dba23b3cad43b4b219b390de208cececc6dd43aa28e28e2a750cea03"
            },
            {
                "amount": 250000000200,
                "parent_coin_info": "0x3ff07eb358e8255a65c30a2dce0e5fbb0000000000000000000000000009999f",
                "puzzle_hash": "0x15fa13b6dba23b3cad43b4b219b390de208cececc6dd43aa28e28e2a750cea03"
            },
            {
                "amount": 1750000000000,
                "parent_coin_info": "0xccd5bb71183532bff220ba46c268991a0000000000000000000000000009999e",
                "puzzle_hash": "0x4bc6435b409bcbabe53870dae0f03755f6aabb4594c5915ec983acf12a5d1fba"
            },
            {
                "amount": 250000000000,
                "parent_coin_info": "0x3ff07eb358e8255a65c30a2dce0e5fbb0000000000000000000000000009999e",
                "puzzle_hash": "0x4bc6435b409bcbabe53870dae0f03755f6aabb4594c5915ec983acf12a5d1fba"
            },
            {
                "amount": 1750000000000,
                "parent_coin_info": "0xccd5bb71183532bff220ba46c268991a0000000000000000000000000009999d",
                "puzzle_hash": "0x907491ca39c35bc1f9a6eda33f7c0f97a9f583975088dad7216f1edd79f522ae"
            },
            {
                "amount": 250000000000,
                "parent_coin_info": "0x3ff07eb358e8255a65c30a2dce0e5fbb0000000000000000000000000009999d",
                "puzzle_hash": "0x907491ca39c35bc1f9a6eda33f7c0f97a9f583975088dad7216f1edd79f522ae"
            },
            {
                "amount": 1750000000000,
                "parent_coin_info": "0xccd5bb71183532bff220ba46c268991a0000000000000000000000000009999c",
                "puzzle_hash": "0x278f3f00498425210adb9762ec1e1bea0c0b72a7912d21355214f3c2d245aadc"
            },
            {
                "amount": 250000000000,
                "parent_coin_info": "0x3ff07eb358e8255a65c30a2dce0e5fbb0000000000000000000000000009999c",
                "puzzle_hash": "0x278f3f00498425210adb9762ec1e1bea0c0b72a7912d21355214f3c2d245aadc"
            },
            {
                "amount": 1750000000000,
                "parent_coin_info": "0xccd5bb71183532bff220ba46c268991a0000000000000000000000000009999b",
                "puzzle_hash": "0x06635ccef09b55ffcb40187937cb83f4d67433400de2ac3feffc60c28c39d19b"
            },
            {
                "amount": 250000000000,
                "parent_coin_info": "0x3ff07eb358e8255a65c30a2dce0e5fbb0000000000000000000000000009999b",
                "puzzle_hash": "0x06635ccef09b55ffcb40187937cb83f4d67433400de2ac3feffc60c28c39d19b"
            }
        ],
        "reward_infusion_new_challenge": "0xba52ce6e9eb62eb3ce164239bf0ea85d41069ad3ac6a602d5be27ded83d80b85",
        "signage_point_index": 38,
        "sub_epoch_summary_included": null,
        "sub_slot_iters": 130023424,
        "timestamp": 1627355621,
        "total_iters": 2164113086668,
        "weight": 594793120
    },
    "success": true
}
```

# Spent
; karlkim -> b330df396937b22d808d295490a3ae7a70510afa7df7b2b2cb62ef764f7ec118
; echo -n karlkim | sha256sum
; https://emn178.github.io/online-tools/sha256.html
;(q . (hello 0xb330df396937b22d808d295490a3ae7a70510afa7df7b2b2cb62ef764f7ec118 1))
; https://clisp.surrealdev.com/
; opc '(q . (hello 0xb330df396937b22d808d295490a3ae7a70510afa7df7b2b2cb62ef764f7ec118 1))'

```json
{
    "spend_bundle": {
        "aggregated_signature": "0xc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "coin_solutions": [
            {
                "coin": {
                    "amount": 100000,
                    "parent_coin_info": "0x83057c6247ddb013f7e341df07d99f743c0d625ed3929e7cc308a21bd9caa450",
                    "puzzle_hash": "0x4843c869bba5f65aa1e806cd372dae5668ca3b69640d067e86837ca96b324e71"
                },
                "puzzle_reveal": "ff02ffff01ff02ffff03ffff09ffff0bff0580ffff01a02cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b982480ffff01ff04ffff04ff02ffff04ff0bffff04ff17ff80808080ff8080ffff01ff088080ff0180ffff04ffff0133ff018080",
                "solution": "ff8568656c6c6fffa0b330df396937b22d808d295490a3ae7a70510afa7df7b2b2cb62ef764f7ec118ff0180"
            }
        ]
    }
}
```

# Lock another coin
## puzzle hash
```sh
brun "`run password-locked.clvm`" '("hello" 0xdeadbeef 1)'
((51 0xdeadbeef 1))

opc -H "`run password-locked.clvm`"
0x4843c869bba5f65aa1e806cd372dae5668ca3b69640d067e86837ca96b324e71

opc "`run password-locked.clvm`"
ff02ffff01ff02ffff03ffff09ffff0bff0580ffff01a02cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b982480ffff01ff04ffff04ff02ffff04ff0bffff04ff17ff80808080ff8080ffff01ff088080ff0180ffff04ffff0133ff018080
```

> `opc` in [Chia-Network/chia-blockchain](https://github.com/Chia-Network/chia-blockchain) returns both

```sh
~
❯ chia version
1.2.4.dev8

~
❯ opc version
8776657273696f6e

~
❯ opc -H "`run ~/try-chia/programming/chialisp/password-locked-tutorial/password-locked.clvm`"

> clvm_tools gets imported into chia-blockchain so there's likely a version difference between using the one from within that virtual environment and installing it directly.

4843c869bba5f65aa1e806cd372dae5668ca3b69640d067e86837ca96b324e71
ff02ffff01ff02ffff03ffff09ffff0bff0580ffff01a02cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b982480ffff01ff04ffff04ff02ffff04ff0bffff04ff17ff80808080ff8080ffff01ff088080ff0180ffff04ffff0133ff018080

```

## get receive address
https://www.chiaexplorer.com/tools/address-puzzlehash-converter
xch1fppus6dm5hm94g0gqmxnwtdw2e5v5wmfvsxsvl5xsd72j6ejfecsdnkf2e


