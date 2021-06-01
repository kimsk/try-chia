FROM python:3.9.5

RUN apt-get update && apt-get -y install cmake protobuf-compiler

#RUN git clone https://github.com/Chia-Network/wallets.git
RUN git clone --branch issue46_blspublicsig_missing_serialize https://github.com/neilb14/wallets.git

WORKDIR /wallets
#COPY . .


RUN pip install -r requirements.txt && pip install -e .
