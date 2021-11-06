function Get-Spend-Bundles
{
    param($Puzzle_Hash)
    $coins =
        cdv rpc coinrecords --by puzhash $Puzzle_Hash -nd
        | ConvertFrom-Json -AsHashtable
        #| ForEach-Object { $_.GetEnumerator() 
        #| Where-Object { $_.spent }
        # | % { $_. }
    $spent_coins =
        $coins.GetEnumerator()
        | Where-Object { $_.Value.spent }
    
    $blokspends = $spent_coins
    | ForEach-Object { 
        cdv rpc blockspends --coinid $_.Name --block-height $_.Value.spent_block_index
        | ConvertFrom-Json
    }

    $blokspends
}

$blockspends = Get-Spend-Bundles -Puzzle_Hash b92a9d42c0f3e3612e98e1ae7b030ed425e076eda6238c7df3c481bf13de3bfd
cdv clsp disassemble $blockspends[0].puzzle_reveal
$blockspends | % { cdv clsp disassemble $_.solution }

# "7c2b4f7d4689571dd2a4651e7bd9b6957646c6988220474a6993e27999c45e7c": {
#     "coin": {
#         "amount": 100,
#         "parent_coin_info": "0x86052ac34f41224c12ed2dfc41a690ab470f2a5779698d32c3a0ffacda3f6737",
#         "puzzle_hash": "0xb92a9d42c0f3e3612e98e1ae7b030ed425e076eda6238c7df3c481bf13de3bfd"
#     },
#     "coinbase": false,
#     "confirmed_block_index": 713274,
#     "spent": true,
#     "spent_block_index": 778356,
#     "timestamp": 1633931744
# }
$dc_puz_hash = "b92a9d42c0f3e3612e98e1ae7b030ed425e076eda6238c7df3c481bf13de3bfd"
cdv rpc coinrecords --by puzhash $dc_puz_hash
$coin_id = "7c2b4f7d4689571dd2a4651e7bd9b6957646c6988220474a6993e27999c45e7c"
$spent_block_index = 778356
cdv rpc blockspends --coinid $coin_id --block-height $spent_block_index
$spent_blocks = cdv rpc blocks -s $spent_block_index -e ($spent_block_index + 1) | ConvertFrom-Json
$spent_block = cdv rpc blockrecords -i $spent_block_index | ConvertFrom-Json
$block_coins = cdv rpc blockcoins $spent_block.header_hash | ConvertFrom-Json

cdv rpc coinrecords --by puzhash $dc_puz_hash -ou