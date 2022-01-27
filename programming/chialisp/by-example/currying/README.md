# [Currying](https://chialisp.com/docs/common_functions#currying)
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

> `(+ 2 5)` is not `7`. Here, `2` and `5` are [argument numbering](https://chialisp.com/docs/ref/clvm#illustration-of-argument-numbering). So `2` is `(f 1)` and `5` is `(f (r 1))` while `1` is the whole solution. This is how we can pull specific value from arguments with help from chialisp compiler.

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

The puzzle is `(q 16 2 5)` which is the same as before `(+ 2 5)`.

```sh
❯ brun '(q 16 2 5)'
(+ 2 5)
```

The new solution is `(c (q . 100) 1)`.

```sh
❯ brun '(c (q . 100) 1)' '(12)'
(100 12)
```

## run by provide `y` only
```sh
❯ cdv clsp curry ./addition.clsp.hex -a 100
(a (q 16 2 5) (c (q . 100) 1))

❯ brun (cdv clsp curry ./addition.clsp.hex -a 100) '(12)'
112
```