 [Testnets](https://github.com/Chia-Network/chia-blockchain/wiki/INSTALL#testnets)

```
CHIA_ROOT="~/.chia/testnet0" chia init
# Change selected network
CHIA_ROOT="~/.chia/testnet0" chia start all
```


```
export CHIA_ROOT="~/.chia/testnet0"
chia init
chia configure -t true
chia wallet show
```

# Testnet7
[faucet](https://chia-faucet.com)
[testnet7 is not scyned](https://github.com/Chia-Network/chia-blockchain/issues/4404)

```
export CHIA_ROOT="~/.chia/testnet7"
chia init
chia configure -t true
chia show -a testnet-node.chia.net:58444
chia show -a beta1_introducer.chia.net:57444
```
