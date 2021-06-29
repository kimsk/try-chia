
# [CLVM (Contract Language Virtual Machine or Chia Lisp Virtual Machine)](https://github.com/Chia-Network/clvm/blob/main/docs/clvm.org)
CLVM is the compiled, minimal version of ChiaLisp.

# [ChiaLisp](https://chialisp.com/)
> The high level language is a superset of clvm, adding several operators.

- [An Introduction to developing in Chialisp](https://www.youtube.com/watch?v=dEFLJSU87K8)
### How does Chialisp relate to the Blockchain?
- A puzzle is a chialisp program that is stored inside of a coin
- A spend is when a puzzle is evaluated with a valid solution.
- When you run the program it will either fail immediately or return some conditions to the network.
- If those conditions are met, then the spend is valid.

### Solutions and Variables
- As a functional language, there are no variables, but we can pass information to a program through the solution.
- A solution is a list of values which can be accessed as part of an evaluation.

### Spends
- A coin is a tuple of (parent ID, a hash of its puzzle, amount)
- A coin's ID is the hash of the above
- A spend specifies a coin ID, reveals the full code of its puzzle, presents a solution, and there's also an aggregated signature
- Anybody can attempt to spend a coin, the aggregated signature opcode enforces ownership

### Smart Transactions

- Smart Transactions: Applications & Use Cases
- Multisig: Green Address, Base Zero
- Atomic Swap: Non-custodial exchanges, payment channels, cross-chain trades
- Authorized Payee Whitelist: Prevent embezzing, internal controls
- Withdrawal Recover Escrow Wallet: Allows a user to detect attemps at unauthorized withdrawals and get the money back
- Withdrawal Rate Limit Wallet: Allows specified employees to spend a certain amount of money per day without approval
- Backup Recovery Key: If a user loses their credentials, the backup recovery key will help them recover their accounts, BTC and ETH have no built-in method of account recovery with an estimated 12-22% of BTC's lost forever
- Colored Coins: Allow issuance of tokens on Chia's blockchain benefiting from the custody and clearing tools available for all smart transactions. Like ERC-20 tokens but better
- Identity Wallet: Create decentralized identifier (DID) and add verifiable credentials to e.g. log in, show completion of KYC/AML, or serve as a digital passport. This wallet will have multi-level delagated recovery features.
- Payment Channels: Allows for near instant payments and vastly reduced on-chain transaction load for scaling and reducing costs.

### Q & A
- Chialisp is designed to be audit-first language
- Chialisp program won't rely on external data (no side-effect)
- Focus on
    - Custodial Arrangement (e.g., BTC's multisig)
    - Chia's Coloured Coins 
        - Support inner smart transaction (more than ETH)
        - Atomic swap one coloured to another (market making can be done without trusted party)
        - Similar to Omni protocol
            - There is a chia coin for every coloured coin
            - Unlike Omni protocol, it can self enforce the coloured coin rule (don't need full node)
    - Digital Identity
- Only side-effect can be done, is coin can be spent and created.
- Simplify UTXO model (simpler than BTC)
- Chialisp allows self-reference programing tricks (e.g., eval, allows covenants)


- [Decentralized Identity in ChiaLisp - A Talk with Urbana-Champaign Blockchain Group (17/07/20)](https://youtu.be/cee9O4ZEPjo)
- [ChiaLisp - what is it good for?](https://www.reddit.com/r/chia/comments/mkbx74/chialisp_what_is_it_good_for/?utm_source=share&utm_medium=web2x&context=3)
- [Chia Founder Bram AMA zoom meeting with Chia China #1 Group(CCG)](https://www.youtube.com/watch?v=ujwSdIkKDZ8)

> Lisp principles turns out to be the good fit for on-chain programming. You need sanboxing to prevent a smart coin to be able to update states outside of it. Lisp has no side-effect of any kind in a language. Lisp is also simple, few operations, easy to audit. 

[metaprogramming](https://youtu.be/2BvIKuohK6I?t=235)
> Advance Chia coin's functionalities requires language to be able to understand itself (i.e., Metaprogramming, eval). The language needs to be able to talk about itself. It needs to be possible to take code snippet of itself, hash them, and/or execute them like doing `eval` constantly. In a language without side-effect, it's reasonably thing to do `eval`.

> Also, UTXO model persists data and state only in coins. State transitions happen only when coines are spent and created. Once the transitions are done, ephermeral disappears.  

> Everything is a coin, so coins have high interoperatability. (Backward pointing covenants?)

> In any given block everything happens simultaneously. There is no ordering of transactions within the block. Farmer can't play around with order of transactions.

> CLVM is not limited to Chialisp as new language that can be compiled to CLVM can be created.

> Chialisp is high-level and has functions, macros, etc.

> The model of thinking is state is in the coin, and the new state is created when the coin is created. No side-effect!

> The standard format transaction supports Taproot & Graftroot

## [CLVM Basics](https://chialisp.com/docs/)

### Accessing Environmental Variables Through Integers
> every unquoted integer in the lower level language refers to a part of the solution.
> imagine a binary tree of `f` and `r`, where each node is numbered.

- `1` returns the entire solution list
```
$ brun '1' '("example" "data" "for" "test")'

("example" "data" "for" "test")
```

- `2` is `f`
- `3` is `r`
- `4` is `(f (f 1))`
- `5` is `(r (f 1))`
- `6` is `(f (r 1))`
- `7` is `(r (r 1))`
```
            1
    2               3
4       5       6       7
...
```


## [Coins, Spends and Wallets](https://chialisp.com/docs/coins_spends_and_wallets/)
### Password Locked Coin

- `CREATE_COIN`- [51] - `(51 puzzlehash amount)`: If this spend is valid, then create a new coin with the given puzzlehash and amount.
- password is `hello` which has the hash value `0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824`.

``` lisp
; CLVM
(i (= 
    (sha256 2)
    (q .0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824)
   )

   (c (q . 51) (c 5 (c (q . 100) ())))
   (q . "wrong password")
)

; Chialisp
(if 
    (= (sha256 2) (q .0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824))
    ; 5 is 0xmynewpuzzlehash
    (51 5 100)
    (q . "wrong password")
)
```

```
$ brun '(i (= (sha256 2) (q . 0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824)) (c (q . 51) (c 5 (c (q . 100) ()))) (q . "wrong password"))' '("incorrect" 0xdeadbeef)'

"wrong password"

$ brun '(i (= (sha256 2) (q . 0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824)) (c (q . 51) (c 5 (c (q . 100) ()))) (q . "wrong password"))' '("hello" 0xdeadbeef)'

(51 0xdeadbeef 100)


$ brun '(f (r 1))' '("hello" 0xdeadbeef)'

0xdeadbeef
```

# Misc
- [Why is Chialisp superior to other on-chain programming solutions?](https://www.youtube.com/watch?v=2uvlop-hlio&t=3358s)

# Dev
- [chia-blockchain/chia/wallet/puzzles/](https://github.com/Chia-Network/chia-blockchain/tree/main/chia/wallet/puzzles)
- [Quexington/chialisp_dev_utility](https://github.com/Quexington/chialisp_dev_utility)