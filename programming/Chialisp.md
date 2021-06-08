
# [CLVM (Contract Language Virtual Machine or Chia Lisp Virtual Machine)](https://github.com/Chia-Network/clvm/blob/main/docs/clvm.org)
CLVM is the compiled, minimal version of ChiaLisp.

# [ChiaLisp](https://chialisp.com/)
> The high level language is a superset of clvm, adding several operators.

- [Decentralized Identity in ChiaLisp - A Talk with Urbana-Champaign Blockchain Group (17/07/20)](https://youtu.be/cee9O4ZEPjo)
- [ChiaLisp - what is it good for?](https://www.reddit.com/r/chia/comments/mkbx74/chialisp_what_is_it_good_for/?utm_source=share&utm_medium=web2x&context=3)

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