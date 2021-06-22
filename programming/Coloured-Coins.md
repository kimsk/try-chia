# [Coloured Coins](https://www.chia.net/2020/04/29/coloured-coins-launch.en.html)

- Normal Chia Coin
> `coinID == sha256(parent_ID + puzzlehash + amount)`

> Coins are locked by a **puzzle**, which is a program written in CLVM

- Coloured coins are a special set of coins that **can be created using chia coins**.

- Unique identifier -- called the colour. In BTC, this is metadata

- Unforgeable
	- No extra value added or removed
	- Value always transfer from legitimate coloured coins -- (coloured parents)
	- Can merge/split but always retain original coloured


## Use Cases
- build new cryptocurrencies on top of chia (similar to ERC-20)
- tie to another crypto (e.g. btc), real world, or financial assets
- chips in virtual casinos

> The first Chialisp smart transaction that we integrated into chia-blockchain were Coloured Coins. We will be integrating additional smart transactions and wallets into chia-blockchain in most releases.

- [Chia Coloured Coins - A Non-technical User Guide](https://www.youtube.com/watch?v=YOlpmCBK8zY)
- [Chia Coloured Coins: Technical Guide (Part 1) - Smart Transactions and ChiaLisp](https://www.youtube.com/watch?v=17pa2t_FQQM)
- [Chia Coloured Coins: Technical Guide (Part 2) - The Coloured Coins Contract & Offers](https://www.youtube.com/watch?v=P33gWX4WmEQ)


## Bitcoin's colored coins

- [colored coin definition](https://whatis.techtarget.com/definition/colored-coin)
- [en.bitcoin.it/wiki/Colored_Coins](https://en.bitcoin.it/wiki/Colored_Coins)
- [The Open Source Protocol for Creating Digital Assets On Bitcoin Blockchain](https://docs.google.com/presentation/d/1geJOeTkIvrIsZMBemJl-Iw5eYalG4w0ftIxsEVRp6lc/edit#slide=id.g90c1efafe_0_53)

> Colored coins can be created to repurpose Bitcoin or altcoins (alternatives to Bitcoin) to create digital assets that represent other things of value.

> the color is generally not a real-world quality; the metaphorical coloring is the addition of metadata.

> This metadata makes it possible to repurpose the original cryptocurrency. This means that a data-based coin in a digital wallet can be used as a backing for a contract or a certificate for redemption. That use benefits from the coin’s security and verifiability of ownership, as well as the convenience of digital transactions. Some examples of things a colored coin may be repurposed to represent include amounts of gold in game currency or shares in a company. They could also be used to create a currency within a currency.


> While originally designed to be a currency, Bitcoin's scripting language allows to store small amounts of metadata on the blockchain, which can be used to represent **asset manipulation instructions**. For example, we can encode in a Bitcoin transaction that 100 units of a new asset were issued and are now credited to a given bitcoin address. A colored coins wallet can create a Bitcoin transaction that encodes sending 50 units of an asset from one address to a new address, and so on.

### - [What are Colored Coins? The Ultimate Guide](https://unblock.net/what-are-colored-coins/)

#### Benefit
> Colored coins could eventually replace many expensive and time consuming financial transactions. For example, in the real estate sector a colored coin could be used to represent the deed for a house, commercial property, or block of land. The owner of the coin becomes the owner of the physical property, and transferring it is as quick and easy as making a Bitcoin transfer.

> Because the Bitcoin network runs on the internet, it is accessible by any internet connected device, anywhere in the world.

#### Risk
> While they are part of the Bitcoin blockchain, they are quite different from ordinary Bitcoin, since they represent real-world physical assets and financial obligations. This means every colored coin needs to be issued by an individual or organization, which adds a layer of risk. The possibility will always exist that the issuer of the colored coin will fail to honor the obligation inherent in the coin. There is even the risk that they don’t represent anything real at all, and are completely fraudulent.

> At this time the biggest disadvantage to colored coins is the lack of wallets that support colored coins. 