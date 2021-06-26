```
brun '(q . 100)'
100

brun '(+ (q . 100) (q . 200))'
300

brun '(divmod (q . 10) (q . 3))'
(i . 1)

brun '(= (q . 10) (q . 10))'
1

brun '(- (q . 10) (q . 10))'
()

brun '(i (q . 1) (q . "true") (q . "false"))'
"true"

brun '(i (q . 0) (q . "true") (q . "false"))'
"false"

brun '(i (q . ()) (q . "true") (q . "false"))'
"false"

brun '(= (q . 0) (q . ()))'
1

brun '(sha256 (q . "hello"))'
0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824

brun '1' '(200 300 400 "hello")'
(200 300 400 "hello")

brun '(f 1)' '(200 300 400 "hello")'
200
brun '(i (= (f 1) (q . 100)) (q . "true") (q . "false"))' '(100)'
"true"

brun '(i (= 2 (q . 100)) (q . "true") (q . "false"))' '(100)'
"true"

run '(list "hello")'
("hello")

run '(mod SOLUTION (list "hello" "test"))'
(q "hello" "test")

brun '(q "hello" "test")'
("hello" "test")

brun '(q "test")'
("test")

brun '(q . "test")'
"test"

brun "`run fact.clvm`" "(5)"
120

run '(if (= (sha256 "hello") (q . 0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824)) "true" "false")'
"true"

brun '(i (= (sha256 1) (q . 0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824)) (q . "true") (q . "false"))' '"hello"'
"true"

run '(mod (arg_one arg_two) (list arg_one arg_two))'
(c 2 (c 5 ()))

brun '(c 2 (c 5 ()))' '(100 200 300)'
(100 200)

```