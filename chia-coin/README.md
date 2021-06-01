# [Chia coins](https://www.chiaexplorer.com/chia-coins)

## Chia Coin
Coins are locked by a **puzzle**, which is a program that takes an input solution.

**If you provide the right solution to the puzzle you can spend the coin.**

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

- Amount - Specifies how much Chia the coin is worth.
- Puzzle hash
    - A program, called the puzzle, which controls how the coin can be spent.
    - Hash of the puzzle contained within the coin. In order to spend the coin you need to reveal the puzzle and provide the correct solution.
- Parent coin info
    - A reference to its parent so you know where the coin come from.
    - For coinbase coins this is the hex value of the height. For transaction fees coins it is the height of the block hashed twice.
- Signature - Can be used to prove the authenticity of the coin.



# [ChiaLisp](https://chialisp.com/)

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


# CLVM