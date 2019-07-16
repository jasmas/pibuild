FROM ubuntu:bionic

WORKDIR /root

# Git and build dependencies
RUN apt-get update && apt-get install -y \
    bc \
    bison \
    flex \
    git \
    libssl-dev \
    make

# Pi toolchain
RUN git clone --depth=1 \
    https://github.com/raspberrypi/tools \
    /opt/pi-tools
ENV PATH /opt/pi-tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin:$PATH

# Fix vim
RUN apt-get install -y vim && \
    git clone --depth=1 \
        https://github.com/amix/vimrc.git \
        /opt/vim_runtime && \
    /opt/vim_runtime/install_awesome_parameterized.sh \
        /opt/vim_runtime \
        root && \
    cat .vimrc >> /etc/vim/vimrc && \
    rm .vimrc

