# [Outer and Inner puzzles](http://localhost:3000/docs/common_functions#outer-and-inner-puzzles)

> We can use puzzle-hash-of-curried-function which allows us to create the puzzle hash of a function given: a) the puzzle hash of that function and b) the puzzle hashes of all of its arguments in reverse order as though they were a part of a tree hash.

1. MOD_HASH: the puzzle hash of that function
2. the puzzle hashes of all of its arguments in reverse order

> arguments that are atoms and numbers are expected to be in tree hash form, with a 1 prefix like (sha256 (q . 1) my-argument-value)

```lisp
(include "curry-and-treehash.clvm")
...
(defun pw-puzzle-hash (MOD_HASH mod_hash_hash new_password_hash_hash inner_puzzle_hash
   (puzzle-hash-of-curried-function
     MOD_HASH
     inner_puzzle_hash new_password_hash_hash mod_hash_hash ; parameters must be passed in reverse order
   )
)
...
(defun-inline morph-condition (condition new_password_hash MOD_HASH)
 (if (= (f condition) CREATE_COIN)
   (list CREATE_COIN
     (pw-puzzle-hash MOD_HASH (sha256tree MOD_HASH) (sha256tree new_password_hash) (f (r condition)))
     (f (r (r condition)))
   )
   condition
 )
)
```