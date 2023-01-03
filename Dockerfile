FROM ubuntu:jammy

ARG SHIM_URL="https://github.com/rhboot/shim/releases/download/15.7/shim-15.7.tar.bz2"
ARG SHIM_HASH="87cdeb190e5c7fe441769dde11a1b507ed7328e70a178cd9858c7ac7065cfade  shim-15.7.tar.bz2"

# dependencies
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -qq --no-install-recommends install build-essential ca-certificates curl

# download shim, verify, extract
WORKDIR /build
RUN curl --silent --location --remote-name ${SHIM_URL}
RUN echo "${SHIM_HASH}" | sha256sum --check
RUN tar -jxvpf $(basename ${SHIM_URL}) && rm $(basename ${SHIM_URL})
WORKDIR /build/shim-15.7

ADD blancco_sb_2022.cer .

# include custom sbat
ADD sbat.csv data/sbat.csv

# build
RUN mkdir build-x64 build-ia32
RUN make -C build-x64 ARCH=x86_64 VENDOR_CERT_FILE=../blancco_sb_2022.cer DEFAULT_LOADER=\\\\grub.efi TOPDIR=.. -f ../Makefile
RUN make -C build-ia32 ARCH=ia32 VENDOR_CERT_FILE=../blancco_sb_2022.cer DEFAULT_LOADER=\\\\grub.efi TOPDIR=.. -f ../Makefile

# set NX compatibility flag
RUN ./build-x64/post-process-pe -vvv -n build-x64/shimx64.efi
RUN ./build-ia32/post-process-pe -vvv -n build-ia32/shimia32.efi

# output
RUN mkdir /build/output
RUN cp build-x64/shimx64.efi /build/output
RUN cp build-ia32/shimia32.efi /build/output

RUN objdump -j .sbat -s /build/output/*
RUN sha256sum /build/output/*