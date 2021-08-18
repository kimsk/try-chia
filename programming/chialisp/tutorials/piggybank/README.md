[2 - Start Writing Your First Smart Coin](https://youtu.be/v1o7fRHGPpM)

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
[3 - Finish Writing Your First Smart Coin](https://www.youtube.com/watch?v=q1ZsTWRKd8A)
[condition_codes.clvm](https://github.com/Chia-Network/chia-blockchain/blob/59de4ffe9f98de62d281695d1f519d65ef2e2ece/chia/wallet/puzzles/condition_codes.clvm)

```sh
cdv clsp retrieve condition_codes
```
> make sure you are in `chia-dev-tools venv`


[4 - Securing a Smart Coin](https://www.youtube.com/watch?v=_SBGfMZhRd8)

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

> ASSERT_MY_PUZZLE_HASH - [72] - (72 puzzlehash): This spend is only valid if the presented puzzle hash is exactly the same as the puzzle hash of the coin that contains this puzzle.

> ASSERT_MY_AMOUNT - [73] - (73 amount): This spend is only valid if the presented amount is exactly the same as the amount of the coin that contains this puzzle.

        - for new_amount, we can secure using signature (but it adds cost and we want anyone to be able to spend the coin)
        - we can use CREATE_COIN_ANNOUCEMENT to secure the new_amount
            - When we want to spend the piggybank coin and increase the amount of the new created coin, they have to be other coins get spend with the exact amount.
                - coin p'A (300) -> coin p'B (400)
                - coin C (200) -> coin D (100)
            - when p'A got spend, we have (CREATE_COIN_ANNOUNCEMENT 400) condition
            - and we make sure coin C can be spent only when there is an ANNOUCEMENT above (100 is spent!) in the same block.

> ASSERT_COIN_ANNOUNCEMENT - [61] - (61 announcementID): This spend is only valid if there was an announcement in this block matching the announcementID. The announcementID is the hash of the message that was announced concatenated with the coin ID of the coin that announced it

            - this is also how we tie coins together (another way is to use signature), so they are not spent seprately.

[5 - Currying](https://www.youtube.com/watch?v=xuXNc3vIDMI)
- Precommitting the solution value
- In previous code, TARGET_AMOUNT & CASH_OUT_PUZZLE_HASH are constants in the code.
- puzzle can be an argument

```lisp
(some puzzle)
```

is the same as

```lisp
(a (some puzzle) 1) ; run this puzzle with the 1 (entire solution)
```

```lisp
; currying
(a (some puzzle) (c TARGET_AMOUNT (c CASH_OUT_PUZZLE_HASH 1)))
```
- chialisp puzzle is unaware of currying

```sh
❯ cdv clsp build ./piggybank.clsp
Beginning compilation of piggybank.clsp...
...Compilation finished

❯ cdv clsp disassemble ./piggybank.clsp.hex
(a (q 2 (i (> 47 23) (q 2 (i (> 47 5) (q 4 (c 6 (c 11 (c 23 ()))) (c (c 6 (c 47 (q ()))) (c (c 4 (c 11 ())) (c (c (q . "ASSERT_MY_PUZZLE_HASH") (c 47 ())) (c (c (q . "CREATE_COIN_ANNOUCEMENT") (c 23 ())) ()))))) (q 4 (c 6 (c 95 (c 47 ()))) (c (c 4 (c 23 ())) (c (c (q . "ASSERT_MY_PUZZLE_HASH") (c 95 ())) (c (c (q . "CREATE_COIN_ANNOUCEMENT") (c 47 ())) ()))))) 1) (q 8)) 1) (c (q 73 . 51) 1))

❯ cdv clsp curry ./piggybank.clsp.hex -a 500 -a 0xcafef00d
(a (q 2 (q 2 (i (> 47 23) (q 2 (i (> 47 5) (q 4 (c 6 (c 11 (c 23 ()))) (c (c 6 (c 47 (q ()))) (c (c 4 (c 11 ())) (c (c (q . "ASSERT_MY_PUZZLE_HASH") (c 47 ())) (c (c (q . "CREATE_COIN_ANNOUCEMENT") (c 23 ())) ()))))) (q 4 (c 6 (c 95 (c 47 ()))) (c (c 4 (c 23 ())) (c (c (q . "ASSERT_MY_PUZZLE_HASH") (c 95 ())) (c (c (q . "CREATE_COIN_ANNOUCEMENT") (c 47 ())) ()))))) 1) (q 8)) 1) (c (q 73 . 51) 1)) (c (q . 500) (c (q . 0xcafef00d) 1)))
```

- this allows us to currying the `inner puzzle` and `inner solution` to manipulate the conditions of the outer puzzle! (`a` is kind of `eval`?)
```lisp
(mod 
    (
        TARGET_AMOUNT
        CASH_OUT_PUZZLE_HASH
        INNER_PUZZLE
        inner_solution
        my_amount
        new_amount
        my_puzzlehash
    )

    ...

    (defun-inline cash_out (my_amount new_amount my_puzzlehash)
        (list
            (c (a INNER_PUZZLE inner_solution))
            (list CREATE_COIN CASH_OUT_PUZZLE_HASH new_amount)
            (list CREATE_COIN my_puzzlehash 0)
            (list ASSERT_MY_AMOUNT my_amount)
            (list ASSERT_MY_PUZZLE_HASH my_puzzlehash)
            (list CREATE_COIN_ANNOUCEMENT new_amount)
        )
    )
    ...
)
```
- almost all smart coins will utilize currying!

[6 - Driver Code](https://www.youtube.com/watch?v=dGohmAc658c)

# Pre-requisite
> make sure you are in `chia-dev-tools venv`

# Why?
- Applications might not be purely in Chialisp
- Chialisp is good at programming money
- Applications might need RPC call or DB management

# What?
- Driver code should be the only interface between Chialisp and the rest of your application.
- `contribution_amount` in python vs `new_amount` in Chialisp
    - `new_amount = current_amount + contribution_amount`, but we want least calculation happens on Blockchain (in chialisp), so we calculate in python instead.
    - python's `[pb_coin.amount, (pb_coin.amount + contribution_amount), pb_coin.puzzle_hash]` is a list `(my_amount new_amount my_puzzlehash)` in chialisp
    - python's `(first, rest)` is `(first . rest)` (conbox) in chialisp. 


[7 - Writing Smart Coin Tests](https://youtu.be/9tvcZrknc7I)

> make sure you are in `chia-dev-tools venv`

- [examples](https://github.com/Chia-Network/chia-dev-tools/tree/main/cdv/examples)

[8 - Deploying a Smart Coin to the Blockchain](https://www.youtube.com/watch?v=Y_p9qF2XLks)

1. `cdv clsp build` to get `hex`.
2. `cdv clsp curry` to bind values to puzzle and get its `treehash`

> need to get your own valid puzzle hash from your wallet.

3. we can get address from the final puzzle hash (i.e., treehash in #2)

```sh
❯ cdv decode txch1p3uemtwt6tauwxvhd4c005pfucyjxqf7nqvv4vt0g6r95mr5sgtsexj494
0c799dadcbd2fbc719976d70f7d029e60923013e9818cab16f46865a6c748217

❯ cdv clsp curry ./clsp/piggybank.clsp.hex -a 500 -a 0x0c799dadcbd2fbc719976d70f7d029e60923013e9818cab16f46865a6c748217
(a (q 2 (q 2 (i (> 95 47) (q 2 (i (> 95 5) (q 4 (c 10 (c 11 (c 95 ()))) (c (c 10 (c 23 (q ()))) (c (c 8 (c 47 ())) (c (c 12 (c 23 ())) (c (c 14 (c 95 ())) ()))))) (q 4 (c 10 (c 23 (c 95 ()))) (c (c 8 (c 47 ())) (c (c 12 (c 23 ())) (c (c 14 (c 95 ())) ()))))) 1) (q 8)) 1) (c (q (73 . 72) 51 . 60) 1)) (c (q . 500) (c (q . 0x0c799dadcbd2fbc719976d70f7d029e60923013e9818cab16f46865a6c748217) 1)))

❯ cdv clsp curry ./clsp/piggybank.clsp.hex -a 500 -a 0x0c799dadcbd2fbc719976d70f7d029e60923013e9818cab16f46865a6c748217 --treehash
44838d46df6aed6b96b9fa9f7769025f5c413524f6ca51247f5688368bbbf8ef

❯ cdv encode 44838d46df6aed6b96b9fa9f7769025f5c413524f6ca51247f5688368bbbf8ef --prefix txch
txch1gjpc63kldtkkh94el20hw6gztawyzdfy7m99zfrl26yrdzamlrhs9s38aq
```