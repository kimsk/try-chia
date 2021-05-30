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
- Puzzle hash - Hash of the puzzle contained within the coin. In order to spend the coin you need to reveal the puzzle and provide the correct solution.
- Parent coin info - For coinbase coins this is the hex value of the height. For transaction fees coins it is the height of the block hashed twice.
- Signature - Can be used to prove the authenticity of the coin.



# [ChiaLisp](https://chialisp.com/)

- [Decentralized Identity in ChiaLisp - A Talk with Urbana-Champaign Blockchain Group (17/07/20)](https://youtu.be/cee9O4ZEPjo)

# Coloured Coins
> The first Chialisp smart transaction that we integrated into chia-blockchain were Coloured Coins. We will be integrating additional smart transactions and wallets into chia-blockchain in most releases.