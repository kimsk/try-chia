# addition.clsp

## code
```lisp
(mod (x y) (+ x y))
```

## build and disassemble
```sh
❯ cdv clsp build addition.clsp
Beginning compilation of addition.clsp...
...Compilation finished

❯ cdv clsp disassemble ./addition.clsp.hex
(+ 2 5)
```

> `(+ 2 5)` is not `5 + 2`, `2` and `5` are [argument numbering](https://chialisp.com/docs/ref/clvm#illustration-of-argument-numbering). So `2` is `(f 1)` and `5` is `(f (r 1))`. `1` is the whole solution.

```sh
❯ brun '(f 1)' '(100 12)'
100

❯ brun '2' '(100 12)'
100

❯ brun '(f (r 1))' '(100 12)'
12

❯ brun '5' '(100 12)'
12
```

## run with solution
```sh
❯ brun (cdv clsp disassemble ./addition.clsp.hex) '(100 12)'
112

❯ brun '(+ 2 5)' '(100 12)'
112
```

## curry `x` with 100
```sh
❯ cdv clsp curry ./addition.clsp.hex -a 100
(a (q 16 2 5) (c (q . 100) 1))
```

## run by provide `y` only
```sh
❯ cdv clsp curry ./addition.clsp.hex -a 100
(a (q 16 2 5) (c (q . 100) 1))

❯ brun (cdv clsp curry ./addition.clsp.hex -a 100) '(12)'
112
```