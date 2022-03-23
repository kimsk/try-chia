Get-Content -Wait /home/karlkim/.chia/testnet/log/debug.log | ? { $_ -match "[.\s]+[1-9]* plots were eligible[.\s]+"}
