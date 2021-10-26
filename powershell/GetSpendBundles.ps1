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
    | ForEach-Object { cdv rpc blockspends --coinid $_.Name --block-height $_.Value.spent_block_index | ConvertFrom-Json }

    $blokspends
}

Get-Spend-Bundles -Puzzle_Hash b92a9d42c0f3e3612e98e1ae7b030ed425e076eda6238c7df3c481bf13de3bfd
| % { cdv clsp disassemble $_.solution }