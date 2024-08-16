FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# Update and basic utils
RUN apt update -y \
  && apt-get -y update --fix-missing \
  && apt -y install git procps coreutils unzip apt-utils wget openjdk-8-jdk build-essential gcc g++

WORKDIR /workspace

# Add p2rank and p2rank datasets
RUN wget https://github.com/rdk/p2rank/releases/download/2.4/p2rank_2.4.tar.gz \
  && tar xvzf p2rank_2.4.tar.gz \
  && mv p2rank_2.4 /opt/p2rank \
  && rm p2rank_2.4.tar.gz

ENV PATH /opt/p2rank:$PATH

#RUN echo "source activate base" >> ~/.bashrc
# p2rank datasets for training and evaluation - may not be needed immediately
#RUN git clone https://github.com/rdk/p2rank-datasets.git