$rq_puzzhash = New-TemporaryFile
@{ puzzle_hash = "3573289a5cffdaaa82fed0c5e46f647ae86cb6c5c2b9fcd37f3f69384ddd2a03" } | ConvertTo-Json | Set-Content $rq_puzzhash
chia rpc full_node get_coin_records_by_puzzle_hash -j $rq_puzzhash
# ❯ chia rpc full_node get_coin_records_by_puzzle_hash -j $rq_puzzhash
# {
#     "coin_records": [
#         {
#             "coin": {
#                 "amount": 1000000000000,
#                 "parent_coin_info": "0x7e5115721a9fe1466ffc3ca09c0f1873a9992a2b977e7b91eaf1ab29e53107cf",
#                 "puzzle_hash": "0x3573289a5cffdaaa82fed0c5e46f647ae86cb6c5c2b9fcd37f3f69384ddd2a03"
#             },
#             "coinbase": false,
#             "confirmed_block_index": 911045,
#             "spent": false,
#             "spent_block_index": 0,
#             "timestamp": 1651387633
#         },
#         {
#             "coin": {
#                 "amount": 1000000000000,
#                 "parent_coin_info": "0x2fa16c15079001350b280956a5388e8b9b13b0d55bc2de364a9e6fd36ff22d9a",
#                 "puzzle_hash": "0x3573289a5cffdaaa82fed0c5e46f647ae86cb6c5c2b9fcd37f3f69384ddd2a03"
#             },
#             "coinbase": false,
#             "confirmed_block_index": 910960,
#             "spent": false,
#             "spent_block_index": 0,
#             "timestamp": 1651386213
#         }
#     ],
#     "success": true
# }

$rq_hint = New-TemporaryFile
@{ hint = "b23dee66835e536f7f1ce287b0837c0cb12aabfe250719cb19302db8ecceac73" } | ConvertTo-Json | Set-Content $rq_hint
chia rpc full_node get_coin_records_by_hint -j $rq_hint


# ❯ chia rpc full_node get_coin_records_by_hint -j $rq_hint
# {
#     "coin_records": [
#         {
#             "coin": {
#                 "amount": 1000000000000,
#                 "parent_coin_info": "0x7e5115721a9fe1466ffc3ca09c0f1873a9992a2b977e7b91eaf1ab29e53107cf",
#                 "puzzle_hash": "0x3573289a5cffdaaa82fed0c5e46f647ae86cb6c5c2b9fcd37f3f69384ddd2a03"
#             },
#             "coinbase": false,
#             "confirmed_block_index": 911045,
#             "spent": false,
#             "spent_block_index": 0,
#             "timestamp": 1651387633
#         }
#     ],
#     "success": true
# }


@{puzzle_hash="eff07522495060c066f66f32acc2a77e3a3e737aca8baea4d1a64ea4cdc13da9";include_spent_coins=$True;start_height=1950158} | ConvertTo-Json | Set-Content $js
chia rpc full_node get_coin_records_by_puzzle_hash -j $js
# {
#     "coin_records": [
#         {
# 2a6c4e70c32799eb1ebe5971754d50b5432d13602dbe913d047189413df5c46d                
#             "coin": {
#                 "amount": 1,
#                 "parent_coin_info": "0xb10e7583998b48380df492b6133c54048a96c96cdfb1793cd4eb3e5d840199f1",
#                 "puzzle_hash": "0xeff07522495060c066f66f32acc2a77e3a3e737aca8baea4d1a64ea4cdc13da9"
#             },
#             "coinbase": false,
#             "confirmed_block_index": 1950245,
#             "spent": true,
#             "spent_block_index": 1950245,
#             "timestamp": 1652074082
#         }...
#     ]...
# }

run '(sha256 0xb10e7583998b48380df492b6133c54048a96c96cdfb1793cd4eb3e5d840199f1 0xeff07522495060c066f66f32acc2a77e3a3e737aca8baea4d1a64ea4cdc13da9 1)'
# 0x2a6c4e70c32799eb1ebe5971754d50b5432d13602dbe913d047189413df5c46d

@{name="0x2a6c4e70c32799eb1ebe5971754d50b5432d13602dbe913d047189413df5c46d"} | ConvertTo-Json | Set-Content $js
chia rpc full_node get_coin_record_by_name -j $js
# {
#     "coin_record": {
#         "coin": {
#             "amount": 1,
#             "parent_coin_info": "0xb10e7583998b48380df492b6133c54048a96c96cdfb1793cd4eb3e5d840199f1",
#             "puzzle_hash": "0xeff07522495060c066f66f32acc2a77e3a3e737aca8baea4d1a64ea4cdc13da9"
#         },
#         "coinbase": false,
#         "confirmed_block_index": 1950245,
#         "spent": true,
#         "spent_block_index": 1950245,
#         "timestamp": 1652074082
#     },
#     "success": true
# }


@{coin_id="0x2a6c4e70c32799eb1ebe5971754d50b5432d13602dbe913d047189413df5c46d";height=1950245} | ConvertTo-Json | Set-Content $js
chia rpc full_node get_puzzle_and_solution -j $js
# {
#     "coin_solution": {
#         "coin": {
#             "amount": 1,
#             "parent_coin_info": "0xb10e7583998b48380df492b6133c54048a96c96cdfb1793cd4eb3e5d840199f1",
#             "puzzle_hash": "0xeff07522495060c066f66f32acc2a77e3a3e737aca8baea4d1a64ea4cdc13da9"
#         },
#         "puzzle_reveal": "0xff02ffff01ff04ffff04ff04ffff04ff05ffff04ff0bff80808080ffff04ffff04ff0affff04ffff02ff0effff04ff02ffff04ffff04ff05ffff04ff0bffff04ff17ff80808080ff80808080ff808080ff808080ffff04ffff01ff33ff3cff02ffff03ffff07ff0580ffff01ff0bffff0102ffff02ff0effff04ff02ffff04ff09ff80808080ffff02ff0effff04ff02ffff04ff0dff8080808080ffff01ff0bffff0101ff058080ff0180ff018080",
#         "solution": "0xffa0a793802e86673478fe2f9004ccc8be442b2af8add4bbc74c159c62b30778a478ff01ffffff70c07201038020777fd4752a8bc8b25f8f91beedc9df49a355b9ff97cacf602818c4e69671ac5967e60957eb9ba20c9e183e50ab3c6702ec678b9562b14bb871f3f07f2b74d892f69817b5aa213625aa144c911455010000001768747470733a2f2f636869612e636f706f6f6c2e636f6d00000020ffff7483093a80ffff68a050d0c024f58f3b52c5083a81747e9eab6e9812e8f36e405949ee20e37bf604908080"
#     },
#     "success": true
# }

