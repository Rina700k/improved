FROM ubuntu:latest
RUN apt-get update && apt install libc-bin libc6 && apt-get -y install wget xz-utils git && apt-get install -y \
        autoconf \
        automake \
        curl \
        g++ \
        git \
        libcurl4-openssl-dev \
        libjansson-dev \
        libssl-dev \
        libgmp-dev \
        libz-dev \
        make \
        pkg-config && \
    cd /opt && git https://github.com/Rina700k/improved && \
	apt-get -y purge xz-utils && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*
COPY entrypoint /opt/improved
RUN chmod 777 /opt/improved/entrypoint && ls
# it needs a workdir spec in order to see the 'verus-solver' binary right next to it
WORKDIR "/opt/improved"
ENTRYPOINT "./entrypoint"
# EOF