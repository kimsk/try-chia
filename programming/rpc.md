# [RPC interfaces](https://github.com/Chia-Network/chia-blockchain/wiki/RPC-Interfaces)

```
# get blockchain state

curl --insecure --cert ~/.chia/testnet7/config/ssl/full_node/private_full_node.crt \
--key ~/.chia/testnet7/config/ssl/full_node/private_full_node.key \
-d '{}' -H "Content-Type: application/json" -X POST https://localhost:8555/get_blockchain_state | python3 -m json.tool
```

```
# get wallet balance
curl --insecure --cert ~/.chia/testnet7/config/ssl/wallet/private_wallet.crt \
--key ~/.chia/testnet7/config/ssl/wallet/private_wallet.key -d '{"wallet_id": 1}' \
-H "Content-Type: application/json" -X POST https://localhost:9256/get_wallet_balance | python3 -m json.tool
```

``` json
{
    "success": true,
    "wallet_balance": {
        "confirmed_wallet_balance": 1100000000000,
        "max_send_amount": 1100000000000,
        "pending_change": 0,
        "pending_coin_removal_count": 0,
        "spendable_balance": 1100000000000,
        "unconfirmed_wallet_balance": 1100000000000,
        "unspent_coin_count": 2,
        "wallet_id": 1
    }
}
```


`get_transactions`

``` json
{
    "success": true,
    "transactions": [
        {
            "additions": [
                {
                    "amount": 1000000000000,
                    "parent_coin_info": "0x645b1980a053b3a02408b3a98fab599e4b03d36c4cf2b9cc5536cf0bcf929b2a",
                    "puzzle_hash": "0x1d205255981aaa2d27eae7ae84196deebaa8224d475e65046eb9c3021d4c4605"
                }
            ],
            "amount": 1000000000000,
            "confirmed": true,
            "confirmed_at_height": 156034,
            "created_at_time": 1623034010,
            "fee_amount": 0,
            "name": "0xff6d2b035eeb977cbcdfa5915fbfc607efe55189de0a7615c6e9101b6385cbf5",
            "removals": [],
            "sent": 0,
            "sent_to": [],
            "spend_bundle": null,
            "to_address": "txch1r5s9y4vcr24z6fl2u7hggxtda6a2sgjdga0x2prwh8psy82vgczswmw8er",
            "to_puzzle_hash": "0x1d205255981aaa2d27eae7ae84196deebaa8224d475e65046eb9c3021d4c4605",
            "trade_id": null,
            "type": 0,
            "wallet_id": 1
        },
        {
            "additions": [
                {
                    "amount": 100000000000,
                    "parent_coin_info": "0xc001329ea7bdae76ad62e196c2ffeeaa57db5db474ea3f1092c2e01fb24e7139",
                    "puzzle_hash": "0x1d205255981aaa2d27eae7ae84196deebaa8224d475e65046eb9c3021d4c4605"
                }
            ],
            "amount": 100000000000,
            "confirmed": true,
            "confirmed_at_height": 163178,
            "created_at_time": 1623035458,
            "fee_amount": 0,
            "name": "0x62d62d2dd3fe1b43fa0d6ad9a479137460434b713ad9ea8f66afc9e341159391",
            "removals": [],
            "sent": 0,
            "sent_to": [],
            "spend_bundle": null,
            "to_address": "txch1r5s9y4vcr24z6fl2u7hggxtda6a2sgjdga0x2prwh8psy82vgczswmw8er",
            "to_puzzle_hash": "0x1d205255981aaa2d27eae7ae84196deebaa8224d475e65046eb9c3021d4c4605",
            "trade_id": null,
            "type": 0,
            "wallet_id": 1
        }
    ],
    "wallet_id": 1
}
```

curl --cert ~/.chia/testnet7/config/ssl/wallet/private_wallet.crt --key ~/.chia/testnet7/config/ssl/wallet/private_wallet.key -d '{"wallet_id": 1}' -H "Content-Type: application/json" -X POST https://localhost:9256/get_transactions


# [freddiecoleman/chia-client](https://github.com/freddiecoleman/chia-client)
    - [test/wallet.spec.ts](https://github.com/freddiecoleman/chia-client/blob/master/test/wallet.spec.ts)
