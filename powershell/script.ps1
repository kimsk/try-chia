# get mempool size
cdv rpc state | ConvertFrom-Json | Select-Object mempool_size
cdv rpc mempool --ids-only | ConvertFrom-Json | Measure-Object | Select-Object Count

Get-InstalledScript | Format-List *
Get-InstalledScript -Name ConvertFrom-SourceTable | select InstalledLocation
chia show -c | Select-Object -Skip 2 |  /home/karlkim/.local/share/powershell/Scripts/ConvertFrom-SourceTable.ps1

cdv decode txch1h6yq7fz0yhpsejj0xrkghwg0aa8v3rtp9n422l4qy7ar57lseseqw9zzc6 `
| % { cdv rpc coinrecords --by puzhash $_ -ou } `
| ConvertFrom-Json `
| % { $_.coin.amount } `
| Measure-Object -Sum

$a = chia keys show | Select-String -Pattern 'First wallet address: (.*)'
$a.Matches[0].Groups[1].Value

chia keys show `
| Select-String -Pattern 'First wallet address: (.*)' `
| % { cdv decode $_.Matches[0].Groups[1].Value } `
| % { cdv rpc coinrecords --by puzhash $_ -ou | ConvertFrom-Json | % { $_.coin.amount } | Measure-Object -Sum }


chia show -s `
| Select-Object -Skip 11 `
| % { $_ | Select-String -Pattern '([0-9]{6}) \| (.*)' } `
| % { cdv rpc blockcoins $_.Matches[0].Groups[2].Value }


cdv rpc mempool --ids-only > mempool-ids-2021-09-28-11-17AM.json
diff ./mempool-ids-2021-09-28-11AM.json ./mempool-ids-2021-09-28-11-17AM.json

cdv rpc mempool `
| ConvertFrom-Json -AsHashtable `
| % { $_.keys } 

cdv rpc mempool `
| ConvertFrom-Json -AsHashtable `
| % { $_.values } 

cdv rpc mempool `
| ConvertFrom-Json -AsHashTable `
| % { $_.Values } `
| Select-Object -First 1

cdv rpc coinrecords --by puzhash be880f244f25c30cca4f30ec8bb90fef4ec88d612ceaa57ea027ba3a7bf0cc32 -ou -s 650500
cdv rpc blockrecords -i 650797
cdv rpc blockcoins 0xc9714505911676fcfb7b0f56f9231a0a7161aa2f744b6b81ca588f709c5294bd

cdv rpc coinrecords --by puzhash 2e2546cae60daa0ddfd948bf1d3b783c6fad278e4b5c96b2ad60119807ef2ea7 -ou `
| ConvertFrom-Json `
| % { $_.coin }

$coins = '{
    "396d35e71e5109831545f8c862110017e048fe502222897e61a52d4134989c27": {
        "coin": {
            "amount": 100,
            "parent_coin_info": "0x24dd373dabb4b6d05a1ccede763ca806746527c546a40e839860282c47de16b9",
            "puzzle_hash": "0x2e2546cae60daa0ddfd948bf1d3b783c6fad278e4b5c96b2ad60119807ef2ea7"
        },
        "coinbase": false,
        "confirmed_block_index": 686330,
        "spent": false,
        "spent_block_index": 0,
        "timestamp": 1633424539
    },
    "45092af498ddd5f1eb493d295cf4d918131c33a3a13e36e80d2df2488f450bd3": {
        "coin": {
            "amount": 100,
            "parent_coin_info": "0x307e7382a076aa4427a4671de31ed18b1b775ffc011e5bfb384173859a01f0cf",
            "puzzle_hash": "0x2e2546cae60daa0ddfd948bf1d3b783c6fad278e4b5c96b2ad60119807ef2ea7"
        },
        "coinbase": false,
        "confirmed_block_index": 686330,
        "spent": false,
        "spent_block_index": 0,
        "timestamp": 1633424539
    },
    "d8e7d42c235150a718caad9db47a49867835bfc277e6f553db89aa9d78987424": {
        "coin": {
            "amount": 100,
            "parent_coin_info": "0x4d2a59b2d013dcf84339149173e910932ba1161c5dec16dfb8eecbfbe678f819",
            "puzzle_hash": "0x2e2546cae60daa0ddfd948bf1d3b783c6fad278e4b5c96b2ad60119807ef2ea7"
        },
        "coinbase": false,
        "confirmed_block_index": 669097,
        "spent": false,
        "spent_block_index": 0,
        "timestamp": 1633100994
    }
}'

cdv rpc coinrecords --by puzhash 2e2546cae60daa0ddfd948bf1d3b783c6fad278e4b5c96b2ad60119807ef2ea7 -ou -nd`
| ConvertFrom-Json -AsHashtable `
| % { $_.GetEnumerator() `
    | Select-Object @{n='id';e ={$_.name}}`
    , @{n='puzzle hash';e={$_.value.coin.puzzle_hash}}`
    , @{n='amount'; e={$_.value.coin.amount}}}

$coins `
| ConvertFrom-Json -AsHashtable `
| ($c = $_; $c.Keys | % { $c[$_]} )

$coins `
| ConvertFrom-Json -AsHashtable `
| % { $_.GetEnumerator() `
    | Select-Object @{n='id';e ={$_.name}}`
    , @{n='puzzle hash';e={$_.value.coin.puzzle_hash}}`
    , @{n='amount'; e={$_.value.coin.amount}}}