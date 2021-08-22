# get coin id

```sh
> cdv clsp build get_coin_id.clsp ; brun (cdv clsp disassemble get_coin_id.clsp.hex) '(0x056c15928bc48f1af9cab7ef5aba1caf84ab82aafe011c2003860d3705d6d220 0x139fcdbc8769b3c72c6b22c671533ba6793a924fca9131a653dc1b04ee5291dc 100000000000)'
```

# get treehash of get_coin_id
```sh
> cdv clsp build sha256tree.clsp ; cdv clsp build get_coin_id.clsp ; brun (cdv clsp disassemble sha256tree.clsp.hex) (cdv clsp disassemble get_coin_id.clsp.hex)
```