# [Chia coins](https://www.chiaexplorer.com/chia-coins)

## UTXO (Unspent Transaction Output)
- [UTXO (Unspent Transaction Output) and Account Model Comparison v. 2](https://medium.com/hackernoon/utxo-and-account-model-comparison-v-2-cdf9669c6c0d)

## Chia Coin
Coins are locked by a **puzzle**, which is a program written in CLVM that takes an input solution.

**The network has no concept of coin ownership, anybody can attempt to spend any coin on the network.**

**If you provide the right solution to the puzzle you can spend the coin.**

To spend a coin you need 3 pieces of information (and an optional 4th).

- The coin's ID
`coinID == sha256(parent_ID + puzzlehash + amount)`
- The full source of the coin's puzzle
- A solution to the coin's puzzle
- (OPTIONAL) A collection of signatures grouped together, called an aggregated signature

When a coin is spent it is destroyed and it's value is transferred into new coins.

Having ownership of a coin typically means that you control **a private key that allows you to solve the puzzle** that locks the coin. 

To transfer the coin to somebody else you solve the puzzle with your private key and create a new coin which has a puzzle that can only be solved by the private key of the receiver. 

## Wallet

Wallet will solve the puzzle of the old coin for the payer and create a new coin with a puzzle that can be solved by the private key of the payee.

## Smart Contract/Coin

> It is also possible to create smart transactions which are programs that do something more sophisticated before creating a new coin. In Chia smart transactions are created using a programming language called Chialisp.

> Smart contract exists inside of chia coins, hence, smart coins.

## Coins in the Chia blockchain
All coins have an **amount, a puzzle hash, and parent coin info**. Coinbase coins also have a signature.

[coin.py](https://github.com/Chia-Network/chia-blockchain/blob/main/chia/types/blockchain_format/coin.py#L13)
``` python
class Coin(Streamable):
    """
    This structure is used in the body for the reward and fees genesis coins.
    """

    parent_coin_info: bytes32
    puzzle_hash: bytes32
    amount: uint64
...
```

- Amount - Specifies how much Chia the coin is worth.
- Puzzle hash
    - A program, called the puzzle, which controls how the coin can be spent.
    - Puzzlehash is a hash of a ChiaLisp program.
    - ChiaLisp programs can be modelled as trees, so we can hash them using Merkle trees and the Merkle root is the puzzlehash we use in the coin.
    - Hash of the puzzle contained within the coin. In order to spend the coin you need to reveal the puzzle and provide the correct solution.

    ### How do chialisp puzzles affect coins?
    - When you try to spend a coin you send a reveal of its puzzle, a solution, and optionally an aggregated signature.
    - If the program rejects the solution then the spend is not valid.
    - Otherwise the program will return some opcodes to the blockchain.
    - Opcodes are either:
        - This transaction is only valid if X
        - If this transaction is valid then X
    ### Standard Transaction
    - Puzzle should ensure that only the owner can spend the coin
    - Puzzle should ensure that we create a new coin which is locked up for the next owner
    - So it should return the following to the network

``` lisp
((AGG_SIG ownerpubkey) (CREATE_COIN new_puzzle))
```
- Parent coin info
    - A reference to its parent so you know where the coin come from.
    - For coinbase coins this is the hex value of the height. For transaction fees coins it is the height of the block hashed twice.
- Signature - Can be used to prove the authenticity of the coin.


# [CLVM (Contract Language Virtual Machine or Chia Lisp Virtual Machine)](https://github.com/Chia-Network/clvm/blob/main/docs/clvm.org)
CLVM is the compiled, minimal version of ChiaLisp.

# [ChiaLisp](https://chialisp.com/)
> The high level language is a superset of clvm, adding several operators.

- [Decentralized Identity in ChiaLisp - A Talk with Urbana-Champaign Blockchain Group (17/07/20)](https://youtu.be/cee9O4ZEPjo)
- [ChiaLisp - what is it good for?](https://www.reddit.com/r/chia/comments/mkbx74/chialisp_what_is_it_good_for/?utm_source=share&utm_medium=web2x&context=3)


# [Coloured Coins](https://www.chia.net/2020/04/29/coloured-coins-launch.en.html)
Coloured coins are a special set of coins that can be created using chia coins.

Unique identifier -- called the colour.

## Use Cases
- build new cryptocurrencies on top of chia (similar to ERC-20)
- tie to another crypto (e.g. btc), real world, or financial assets
- chips in virtual casinos

> The first Chialisp smart transaction that we integrated into chia-blockchain were Coloured Coins. We will be integrating additional smart transactions and wallets into chia-blockchain in most releases.

- [Chia Coloured Coins - A Non-technical User Guide](https://www.youtube.com/watch?v=YOlpmCBK8zY)
- [Chia Coloured Coins: Technical Guide (Part 1) - Smart Transactions and ChiaLisp](https://www.youtube.com/watch?v=17pa2t_FQQM)
- [Chia Coloured Coins: Technical Guide (Part 2) - The Coloured Coins Contract & Offers](https://www.youtube.com/watch?v=P33gWX4WmEQ)

