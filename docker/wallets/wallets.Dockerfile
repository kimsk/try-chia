FROM python:3.9.5

RUN apt-get update && apt-get -y install cmake protobuf-compiler

RUN git clone https://github.com/Chia-Network/wallets.git

WORKDIR /wallets

RUN pip install -r requirements.txt && pip install -e .
