# Adding outout of the inner puzzle with provided solution with y
```sh
❯ cdv clsp build add_x.clsp
Beginning compilation of add_x.clsp...
...Compilation finished

❯ cdv clsp disassemble add_x.clsp.hex
(+ (a 2 5) 11)

# (2 * 2) + 10 = 14
❯ brun '(+ (a 2 5) 11)' '((* 1 1) 2 10)'
14
```

# Currying inner puzzle
```sh
# curry x^2
❯ cdv clsp curry add_x.clsp.hex -a '(* 1 1)'
(a (q 16 (a 2 5) 11) (c (q 18 1 1) 1))

❯ brun '(a (q 16 (a 2 5) 11) (c (q 18 1 1) 1))' '(2 10)'
14

# curry x^3
❯ cdv clsp curry add_x.clsp.hex -a '(* 1 1 1)'
(a (q 16 (a 2 5) 11) (c (q 18 1 1 1) 1))

❯ brun '(a (q 16 (a 2 5) 11) (c (q 18 1 1 1) 1))' '(2 10)'
18
```