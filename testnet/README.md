 [Testnets](https://github.com/Chia-Network/chia-blockchain/wiki/INSTALL#testnets)

``` sh
CHIA_ROOT="~/.chia/testnet0" chia init
# Change selected network
CHIA_ROOT="~/.chia/testnet0" chia start all
```


``` sh
export CHIA_ROOT="~/.chia/testnet0"
chia init
chia configure -t true
chia wallet show
```

# Testnet7
- [faucet](https://chia-faucet.com)
- [testnet7 is not scyned](https://github.com/Chia-Network/chia-blockchain/issues/4404)

``` sh
export CHIA_ROOT="~/.chia/testnet7"

. ./activate

chia init
chia configure -t true

chia show -a testnet-node.chia.net:58444
chia show -a beta1_introducer.chia.net:57444

chia show -sc
```

# PowerShell
``` ps
$env:CHIA_ROOT = "~/.chia/testnet7";
$env:Path += "C:\Users\kimsk\AppData\Local\chia-blockchain\app-1.2.0\resources\app.asar.unpacked\daemon;"
gci env:

chia init
chia configure -t true
chia keys add

chia start wallet

chia show -a testnet-node.chia.net:58444
chia show -sc

```

