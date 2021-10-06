```sh
❯ brun '(a 2 5)' '((+ 1 1) 101)'

202
```

`a` [Control Flow](https://chialisp.com/docs/ref/clvm#control-flow): a apply `(a P A)` run the program `P `with the arguments `A`. Note that this executes `P` in a new environment. Using integers to reference values in the solution will reference values in `A`.

Here, `2` and `5` are [argument numbering](https://chialisp.com/docs/ref/clvm#illustration-of-argument-numbering). So `2` is `(f 1)` and `5` is `(f (r 1))` while `1` is the whole solution.

`(a 2 5)`: apply `(f (+ 1 1))` with `(f (r 1))`. `1` is the whole solution which is `101`.

```sh
❯ run ../by-example/a/a_x.clsp

(a 2 5)

❯ brun (run ../by-example/a/a_x.clsp) '((+ 1 1) 101)'

202

❯ brun (run ../by-example/a/a_x.clsp) '((c 2 5) (500 ()))'

(500)

❯ brun (run ../by-example/a/a_x.clsp) '((+ 2 5) (10 20))'

30

❯ brun (run ../by-example/a/a_x.clsp) '((+ 2 5 11) (10 20 30))'

60
```
