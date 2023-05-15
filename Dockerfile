FROM nextflow/nextflow:22.10.8

LABEL SOFTWARE_NAME TOGA
LABEL MAINTAINER "Tom Harrop"
LABEL VERSION "v1.1.2"

ENV LC_ALL=C

RUN     yum clean all &&\
        yum update -y

RUN     yum -y install \
                gcc \
                git \
                make \
                python3-pip

RUN     git clone https://github.com/hillerlab/TOGA toga

WORKDIR /toga

RUN     git checkout -f v1.1.2 &&\
        git submodule update --init --recursive &&\
        python3 -m pip install -r requirements.txt &&\
        ./configure.sh

ENTRYPOINT ["/toga/toga.py"]
