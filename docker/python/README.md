```sh
❯ docker build -t karlkim/chia-python -f chia.Dockerfile . 
[+] Building 329.2s (7/7) FINISHED                                                                                                                                                  
 => [internal] load build definition from chia.Dockerfile                                                                                                                      0.0s
 => => transferring dockerfile: 300B                                                                                                                                           0.0s
 => [internal] load .dockerignore                                                                                                                                              0.0s
 => => transferring context: 2B                                                                                                                                                0.0s
 => [internal] load metadata for docker.io/library/python:latest                                                                                                               0.0s
 => CACHED [1/3] FROM docker.io/library/python                                                                                                                                 0.0s
 => [2/3] RUN apt-get update &&     apt-get upgrade -y &&     apt-get -y install cmake &&     apt-get -y install libboost-all-dev                                             51.9s
 => [3/3] RUN pip install chia-dev-tools                                                                                                                                     272.7s 
 => exporting to image                                                                                                                                                         4.5s 
 => => exporting layers                                                                                                                                                        4.5s 
 => => writing image sha256:10948a0e7594fc38dc5bf380d38cde72feef554feadb739eab1315dbdda77f39                                                                                   0.0s 
 => => naming to docker.io/karlkim/chia-python                                                                                                                                 0.0s 
                                                                                                   
```

```sh
❯ docker run -it --rm -v ~/chia/chia-piggybank:/chia-piggybank --name chia-dev karlkim/chia-python bash
root@81e305cfa955:/# python --version
Python 3.10.0
root@81e305cfa955:/# python chia-piggybank/agg_sig/agg_sig-AugSchemeMPL.py
a4d7da9a1c5210352e4487abc45cc09ca7e523630740e208087c4eb5f0c7ea85819c7affae1b1c846feabf49b071ad1d
a4a0b8aed35ad944b287d0a46245c0bc66e1b0ae21cfa0190d90f2dc0a16b0482c44ad5f8b7256357d4f108d4ed5a9d1
a4d62928c171673d15f268812499870346e7ce2d78321a23fc9584ea3c21f090a84215cc522a15de967a96aaae710587
94e90b6a9e971c33889cfed580f1b840dcd6d748e91bb5b366f9746f404f95cc24c312036691a7e6462bb7b2cf0d3163
root@81e305cfa955:/# pip list
Package                Version
---------------------- -------
aiohttp                3.7.4
aiosqlite              0.17.0
argon2-cffi            21.1.0
async-timeout          3.0.1
attrs                  21.2.0
bitstring              3.1.9
blspy                  1.0.6
cffi                   1.15.0
chardet                3.0.4
chia-blockchain        1.2.6
chia-dev-tools         1.0.4
chiabip158             1.0
chiapos                1.0.4
chiavdf                1.0.3
click                  7.1.2
clvm                   0.9.7
clvm_rs                0.1.11
clvm-tools             0.4.3
colorama               0.4.4
colorlog               5.0.1
concurrent-log-handler 0.9.19
cryptography           3.4.7
dnspython              2.1.0
fasteners              0.16.3
idna                   3.3
importlib-metadata     4.8.2
iniconfig              1.1.1
jeepney                0.7.1
keyring                23.0.1
keyrings.cryptfile     1.3.4
multidict              5.2.0
packaging              21.3
pip                    21.2.4
pluggy                 1.0.0
portalocker            2.3.2
py                     1.11.0
pycparser              2.21
pycryptodome           3.11.0
pyparsing              3.0.6
pytest                 6.2.5
pytest-asyncio         0.16.0
pytimeparse            1.1.8
PyYAML                 5.4.1
SecretStorage          3.3.1
setproctitle           1.2.2
setuptools             57.5.0
six                    1.16.0
sortedcontainers       2.3.0
toml                   0.10.2
typing_extensions      4.0.1
watchdog               2.1.3
websockets             8.1
wheel                  0.37.0
yarl                   1.7.2
zipp                   3.6.0
```
