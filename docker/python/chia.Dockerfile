FROM python

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install cmake && \
    apt-get -y install libboost-all-dev
RUN pip install chia-dev-tools