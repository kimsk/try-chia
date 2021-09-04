# .chia/config/config.yaml
> to start `daemon` successfully
```yaml
#self_hostname: localhost
self_hostname: 0.0.0.0
```

# build docker
docker build -t karlkim/chia -f wallet.Dockerfile .


docker run --name chia -it --rm -p 9256:9256 -p 8555:8555 --expose=58444 --expose=8555 -e CHIA_ROOT=~/.chia/testnet7 -v /home/karlkim/.chia:/root/.chia karlkim/chia

docker run --name chia -d --rm -p 9256:9256 -p 8555:8555 --expose=58444 --expose=8555 -e CHIA_ROOT=~/.chia/testnet7 -v /home/karlkim/.chia:/root/.chia karlkim/chia

# keys
docker exec -it chia venv/bin/chia keys add
docker exec -it chia venv/bin/chia keys show

docker stop chia

# if the ports are not forwarded
# show status
docker exec -it chia venv/bin/chia show -s

# wallet
docker exec -it chia venv/bin/chia wallet show

