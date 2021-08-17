[2 - Start Writing Your First Smart Coin | Chialisp](https://youtu.be/v1o7fRHGPpM)

# PiggyBank Coin

- A coin can't be spent until it reaches the spending goal (required balance).

- When reach a spending goal
    - Automatic cashes out to a predetermined puzzle hash
        - Set during puzzle creation
        - Cannot be changed once created
    - Anybody can contribute to piggy bank
        - No signature or permission required
        - Useful for crowd funding
    - Automatic recreation of piggybank upon savings completion
        - This piggybank will always exist
[3 - Finish Writing Your First Smart Coin | Chialisp](https://www.youtube.com/watch?v=q1ZsTWRKd8A)
[condition_codes.clvm](https://github.com/Chia-Network/chia-blockchain/blob/59de4ffe9f98de62d281695d1f519d65ef2e2ece/chia/wallet/puzzles/condition_codes.clvm)

```sh
cdv clsp retrieve condition_codes
```

[4 - Securing a Smart Coin | Chialisp](https://www.youtube.com/watch?v=_SBGfMZhRd8)

```sh
❯ cdv clsp build ./piggybank.clsp
Beginning compilation of piggybank.clsp...
...Compilation finished
```
## Spending a coin
- Send spend bundle to a full node.
- That full node then sends to the other full nodes until the block with the spend get farmed.
- Spend bundle could be changed by other full nodes before it was farmed.
    - `(my amount new_amount my_puzzlehash)` can be changed and excessive fees belong farmer.
    - So you need to make sure you have proper assertions in the [conditions](https://chialisp.com/docs/coins_spends_and_wallets#conditions)
        - solution values have to be secured
        - ASSERT_MY_PUZZLE_HASH - [72] - (72 puzzlehash): This spend is only valid if the presented puzzle hash is exactly the same as the puzzle hash of the coin that contains this puzzle.
        - ASSERT_MY_AMOUNT - [73] - (73 amount): This spend is only valid if the presented amount is exactly the same as the amount of the coin that contains this puzzle.
        - for new_amount, we can secure using signature (but it adds cost and we want anyone to be able to spend the coin)
        - we can use CREATE_COIN_ANNOUCEMENT to secure the new_amount
            - When we want to spend the piggybank coin and increase the amount of the new created coin, they have to be other coins get spend with the exact amount.
                - coin p'A (300) -> coin p'B (400)
                - coin C (200) -> coin D (100)
            - when p'A got spend, we have (CREATE_COIN_ANNOUNCEMENT 400) condition
            - and we make sure coin C can be spent only when there is an ANNOUCEMENT above (100 is spent!).
            - this is also how we tie coins together (another way is to use signature), so they are not spent seprately.

