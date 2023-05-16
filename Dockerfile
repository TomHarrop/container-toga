FROM    nextflow/nextflow:22.10.8

LABEL   SOFTWARE_NAME TOGA
LABEL   MAINTAINER "Tom Harrop"
LABEL   VERSION "v1.1.2"

ENV     PATH="/toga:/chains_builder:/chains_builder/kent_binaries:${PATH}"
ENV     LC_ALL=C

        # Dependencies
RUN     yum clean all &&\
            yum update -y

RUN     yum -y install \
            gcc \
            git \
            make \
            python3-pip \
            wget

        # Install TOGA
RUN     git clone https://github.com/hillerlab/TOGA /toga

WORKDIR /toga

RUN     git checkout -f v1.1.2 &&\
        git submodule update --init --recursive &&\
        python3 -m pip install -r requirements.txt &&\
        ./configure.sh

RUN     mkdir -p /.nextflow/plugins &&\
        chmod -R 777 /.nextflow/plugins

        # Install make_lastz_chains

RUN     git clone \
            https://github.com/hillerlab/make_lastz_chains.git \
            /chains_builder

WORKDIR /chains_builder

RUN     git checkout -f ee21f172fa7f473b7b7f5b8872daaee4746b07f0 &&\
        python3 -m pip install -r requirements.txt &&\
        ./install_dependencies.py

ENTRYPOINT  ["/toga/toga.py"]
