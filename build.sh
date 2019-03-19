#!/bin/bash

DIR="$( pwd )"
echo $DIR

# Build gtest
cd /usr/src/gtest && sudo cmake . && sudo make

# Build sonic-swss-common
SONIC_SWSS_COMMON_BIN_DIR=sonic-swss-common.bin

cd ${DIR}/sonic-swss-common
mkdir -p ${SONIC_SWSS_COMMON_BIN_DIR}
./autogen.sh  
./configure --prefix=${DIR}/sonic-swss-common/${SONIC_SWSS_COMMON_BIN_DIR}
make && make install 

# TODO: fix sonic-swss-common Makefile
# Prepare swss-common include files and library
cd ${DIR}
rm -rf ${DIR}/swss-common
sh ${DIR}/copy-swss-header-file-and-library.sh ${DIR}/sonic-swss-common ${DIR}/swss-common

cd ${DIR}/sonic-sairedis  

# Patch sonic-sairedis/configure.ac
patch -p1 < ${DIR}/configure.ac.patch

# Patch
cd  ${DIR}/sonic-sairedis/SAI
patch -p1 < ${DIR}/SAI_meta_Makefile.patch
cd ${DIR}/sonic-sairedis

# Build sonic-sairedis
SWSS_COMMON_INC_DIR=${DIR}/swss-common/include
SWSS_COMMON_LIB_DIR=${DIR}/swss-common/lib

export PERL5LIB=$PERL5LIB:${DIR}/sonic-sairedis/SAI/meta  
./autogen.sh  
./configure --with-sai=vs CPPFLAGS="-I${SWSS_COMMON_INC_DIR}" LDFLAGS="-L${SWSS_COMMON_LIB_DIR}" 
make