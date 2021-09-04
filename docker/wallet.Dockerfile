FROM ghcr.io/chia-network/chia:latest

EXPOSE 8555
EXPOSE 8444

ENV PATH=/chia-blockchain/venv/bin/:$PATH
WORKDIR /chia-blockchain
ADD ./wallet.entrypoint.sh entrypoint.sh

ENTRYPOINT ["bash", "./entrypoint.sh"]
