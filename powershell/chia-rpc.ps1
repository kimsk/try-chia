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