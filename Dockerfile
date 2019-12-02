FROM ubuntu:18.04
FROM continuumio/miniconda3

LABEL maintainer="Jorge Barrios <jorgebarrios@email.arizona.edu>"

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip && \
	apt-get install conda
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

	
RUN python3 -m pip install --upgrade --no-cache-dir pip
RUN python3 -m pip install --upgrade --no-cache-dir setuptools
RUN python3 -m pip install numpy
RUN conda install jupyter
RUN jupyter notebook

