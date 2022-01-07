FROM ubuntu:focal


RUN apt-get update \
  && apt-get install -y \
     libsqlite3-0 \
     libsqlite3-dev \
  && apt-get install -y \
     apt-utils \
     build-essential \
     locales \
     python-pip-whl \
     python3-pip \
     python3-setuptools \
     software-properties-common \
  && add-apt-repository -y ppa:ethereum/ethereum
  
  
RUN apt update \
  && apt install "ethereum"
  
   
RUN apt-get update \
  && apt-get install -y \
     solc \
     libssl-dev \
     python3-dev \
     pandoc \
     git \
     wget \
  && ln -s /usr/bin/python3 /usr/local/bin/python
  
  
COPY ./requirements.txt  ./requirements.txt

RUN pip3 install -r requirements.txt

RUN myth version

RUN mkdir -p /home/mythril

WORKDIR /home/mythril

ENTRYPOINT ["/usr/local/bin/myth"]

