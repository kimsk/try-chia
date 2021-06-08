(if 
    (= (sha256 2) (q .0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824))
    ; (c (q . 51) (c 5 (c (q . 100) ())))
    ; 51 is the OpCode to create a new coin
    ; 5 is equivalent to (f (r 1))
    (51 0xmynewpuzzlehash 100)
    (q . "wrong password")
)

; brun '(i (= (sha256 2) (q . 0x2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824)) (c (q . 51) (c 5 (c (q . 100) ()))) (q . "wrong password"))' '("hello" 0xdeadbeef)'
; (51 0xdeadbeef 100)


; brun '(f (r 1))' '("hello" 0xdeadbeef)'
; 0xdeadbeef