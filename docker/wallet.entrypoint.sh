cd /chia-blockchain

. ./activate

chia configure -t true
chia configure --set-fullnode-port 58444

chia start wallet

while true; do sleep 30; done;