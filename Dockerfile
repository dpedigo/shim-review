FROM ubuntu:jammy

ARG SHIM_URL="https://github.com/rhboot/shim/releases/download/15.6/shim-15.6.tar.bz2"
ARG SHIM_HASH="eab91644a3efe91a666399f5d8eb3eed0e04d04f79d4b6c0b278ef7747a239a5 shim-15.6.tar.bz2"

# dependencies
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -qq --no-install-recommends install build-essential ca-certificates curl

# download shim, verify, extract
WORKDIR /build
RUN curl --silent --location --remote-name ${SHIM_URL}
RUN echo "${SHIM_HASH}" | sha256sum --check
RUN tar -jxvpf $(basename ${SHIM_URL}) && rm $(basename ${SHIM_URL})
WORKDIR /build/shim-15.6

ADD blancco_sb_2022.cer .

# include custom sbat
ADD sbat.csv data/sbat.csv

# build
RUN mkdir build-x64 build-ia32
RUN make -C build-x64 ARCH=x86_64 VENDOR_CERT_FILE=../blancco_sb_2022.cer DEFAULT_LOADER=\\\\grub.efi TOPDIR=.. -f ../Makefile
RUN make -C build-ia32 ARCH=ia32 VENDOR_CERT_FILE=../blancco_sb_2022.cer DEFAULT_LOADER=\\\\grub.efi TOPDIR=.. -f ../Makefile

# output
RUN mkdir /build/output
RUN cp build-x64/shimx64.efi /build/output
RUN cp build-ia32/shimia32.efi /build/output

RUN objdump -j .sbat -s /build/output/*
RUN sha256sum /build/output/*