#!/bin/bash

#module swap gnu gnu/12.2.0
module load netcdf/4.7
module load hdf5/1.12

export NETCDF=/N/soft/rhel8/netcdf/gnu/4.7/
export NETCDF_DIR=${NETCDF}
export HDF5=/N/soft/rhel8/hdf5/gnu/1.12/

export CPPFLAGS=-I${NETCDF}/include
export LDFLAGS=-L${NETCDF}/lib

export FCFLAGS="-g -fno-range-check"
export CC="-g -fno-range-check"
export FC="-g -fno-range-check"
export FFLAGS="-g -fno-range-check"

export LDFLAGS="-g -fno-range-check"
export CPPFLAGS="-g -fno-range-check"
export LDFLAGS="-g -fno-range-check"

export FCFLAGS="-I${NETCDF_DIR}/include" # -fallow-argument-mismatch -fallow-invalid-boz"
export FC="gfortran -I${NETCDF_DIR}/include -fallow-argument-mismatch -fallow-invalid-boz"
export CPPFLAGS=-I${NETCDF_DIR}/include
export LDFLAGS=-L${NETCDF_DIR}/lib
export MPIFC="mpif90 -I${NETCDF_DIR}/include -fallow-argument-mismatch -fallow-invalid-boz"
export AR=ar


#	--enable-nc4-gzip \
#	--enable-nc4
#	--enable-clm45

#set -x
#set -e

./configure \
	--with-netcdf=$NETCDF_DIR \
	--with-hdf5=$HDF5_DIR 
	
	--enable-debug
make clean

make -j8 install
