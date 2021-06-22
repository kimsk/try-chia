# [An Introduction to developing in Chialisp](https://www.youtube.com/watch?v=dEFLJSU87K8)
# [On-Chain Programming](https://www.youtube.com/watch?v=9P0vaux2h6o&t=584s) 
## UTXO (Unspent Transaction Output)
- [UTXO (Unspent Transaction Output) and Account Model Comparison v. 2](https://medium.com/hackernoon/utxo-and-account-model-comparison-v-2-cdf9669c6c0d)

## [Chia coins](https://www.chiaexplorer.com/chia-coins)
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

# Decentralized Identity
## [Decentralized Identity in ChiaLisp - A Talk with Urbana-Champaign Blockchain Group (17/07/20)](https://www.youtube.com/watch?v=cee9O4ZEPjo)

# [Chialisp](./Chialisp.md)
# [Coloured Coins](./Coloured-Coins.md)


# Keybase Notes:
- quexington
- hoffmang
- matt_howard
- sorgente711

> It's not that smart contracts aren't native to chia its that the entire ecosystem requires a different way of thinking. Coins are the fundamental representation of state on the blockchain and state/coins get updated atomically in transactions. 
In Ethereum you pay to access state/memory/storage and pay to execute operations on that information. **In Chia this is modelled entirely as spending a coin.** 
Spending a coin is not a secondary requirement to access smart contracts / chialisp, it is the first principle of access as coins are built out of chialisp programs and changing state on the chain or progressing the state of a system requires you to spend that coin to run that code. 

> The coins themselves are the smart contracts. 

> **A spend in chia doesn't necessarily mean that the coin is changing ownership, it simply means that the code has been run successfully** - and what happens after that depends on the puzzle and the solution


> While calling them smart contracts isn't as technically accurate as calling them smart coins, it's not merely marketing jargon. ChiaLisp and the smart coins enable all the features that people want, but its a new way of thinking about things that people are getting used to, calling them smart contracts gives people a frame of reference for what they're achieving. 

> And there is a precedent for people building smart contracts (and calling them such) using bitcoin script. One paper that provided a lot of inspiration for chialisp was this one on building zero-collateral lotteries - https://arxiv.org/pdf/1612.05390.pdf 

> The pool implementation is very cool, the best files to look at if you want to understand it are: `p2_singleton.clvm`, `singleton_top_layer.clvm`, `pool_member_innerpuz.clvm`, and `pool_waitingroom_innerpuz.clvm`. Also the zoom presentation from a couple of days ago and I explained the launcher process here: keybase://chat/chia_network.public#chialisp/2155 

Chia does allow state storage, you just need to think about it differently 

Coins *are* state and they contain data called puzzles which can contain any data/state you like 

and also Solutions are stored on the blockchain which can also store data 

We want to create a demo of arbitrary storage and retrieval inside a coin as memory, but pooling is a higher priority first 

But to persist it for subsequent use, you need to spend it and create a new coin? 

You can always look the data up again in the blockchain, if you stored it in certain ways (encrypted or plaintext) 

But if you need to change it, you have to spend the coin 

There are two ways to store data in the chain: in puzzle reveals, or in puzzle outputs (announcements/conditions) 

Is there a minimum number of coins to spend to trigger a puzzle / reveal an output ? For example could you trigger something by only spending 1 Mojo ? 

You can spend a coin of 0 value even 

talked about a language server in #general, coming together, see demo at:
https://clls-dev.github.io/ 

the next questions, given a puzzle(which is that lisp program), I understand that I have to generate a puzzle hash?


how does that puzzle -> puzzle hash happen? did I store it somewhere and get the hash? 

You run it on blockchain by creating a coin secured by puzzle hash of the puzzle you want and then you spend it with valid solution 

Deploying Chialisp is something that is very lacking in tooling atm and under development.  Basically you need to construct a Spend Bundle and use the push_tx endpoint to send it to the network.  The best thing I can recommend atm is something I built https://github.com/Quexington/chialisp_dev_utility which can let you mess with a `Node` object and push transactions to it to test out your puzzles.  If you construct a spend bundle there, you can print it out and convert it one line JSON to push to the actual full node 

As for puzzle hashes, the algorithm is described here: https://chialisp.com/docs/common_functions#sha256tree1 

Chialisp can do uniswap much better than other chains. Bram has a blog post coming shortly. 

Coin has only puzzle hash stored there so when