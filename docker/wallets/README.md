## build docker image
```
docker build -f wallets.Dockerfile -t karlkim/chia-wallets .
```

## run ledger-sim
```
docker run --rm -it --name ledger-sim karlkim/chia-wallets ledger-sim
```

## run wallet
```
docker exec -it ledger-sim wallet
```
