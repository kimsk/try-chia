[Programming in Chialisp](https://chialisp.com/docs/tutorials/programming_chialisp)

> CLVM has no type, so, the first atom, 6 (or other low numbers) might be displayed as operator.
```sh
❯ run '(divmod 67 10)'
(r . 7)

❯ run '(q . (6 . 7))'
(r . 7)
```

> showing ASCII
```sh
❯ run '(concat 99 "full nodes on the net")'
"cfull nodes on the net"

❯ run '(concat "hello there " (+ 98 9))'
"hello there k"
```