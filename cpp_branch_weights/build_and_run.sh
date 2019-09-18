#!/bin/sh

CWD=$(pwd)

LINKER=lld

rm -rf ./profdata
rm -rf ./build

mkdir -p ./profdata
mkdir -p ./build
mkdir -p ./outputs

rustup override set 0-rust-2

#--------------------------------
# Build the instrumented binary
#--------------------------------
clang-8 -c \
      -O3 \
      -ffunction-sections -fdata-sections \
      -o ./build/opaque.o \
      opaque.c

ar rsc ./build/libopaque.a ./build/opaque.o

clang-8 -O3 -c -o ./build/opt_lib.o \
      -fprofile-generate=$CWD/profdata \
      -ffunction-sections -fdata-sections \
      opt_lib.c

clang-8 -O3 -c -S -emit-llvm -o ./outputs/opt_lib_gen.ll \
      -fprofile-generate=$CWD/profdata \
      -ffunction-sections -fdata-sections \
      opt_lib.c

ar rsc ./build/libopt_lib.a ./build/opt_lib.o

clang-8 -O3 -fuse-ld=$LINKER \
      -fprofile-generate=$CWD/profdata \
      -ffunction-sections -fdata-sections \
      -o ./build/pgo_gen \
      branch_weights.c \
      -L ./build \
      -lopt_lib \
      -lopaque

#--------------------------------
# Collect profile
#--------------------------------
./build/pgo_gen > /dev/null
./build/pgo_gen > /dev/null
./build/pgo_gen > /dev/null
./build/pgo_gen > /dev/null
./build/pgo_gen > /dev/null
./build/pgo_gen > /dev/null
./build/pgo_gen > /dev/null
./build/pgo_gen > /dev/null
./build/pgo_gen > /dev/null
./build/pgo_gen > /dev/null

llvm-profdata merge -o ./profdata/merged.profdata ./profdata


#--------------------------------
# Build using profile
#--------------------------------

rm ./build/*.a

clang-8 -c \
      -O3 \
      -o ./build/opaque.o \
      opaque.c

ar rsc ./build/libopaque.a ./build/opaque.o

clang-8 -O3 -c -o ./build/opt_lib.o \
      -fprofile-use=$CWD/profdata/merged.profdata \
      -ffunction-sections -fdata-sections \
      opt_lib.c

clang-8 -O3 -c -S -emit-llvm -o ./outputs/opt_lib_use.ll \
      -fprofile-use=$CWD/profdata/merged.profdata \
      -ffunction-sections -fdata-sections \
      opt_lib.c

ar rsc ./build/libopt_lib.a ./build/opt_lib.o

clang-8 -O3 -fuse-ld=$LINKER \
      -fprofile-use=$CWD/profdata/merged.profdata \
      -ffunction-sections -fdata-sections \
      -o ./build/pgo_use \
      branch_weights.c \
      -L ./build \
      -lopt_lib \
      -lopaque

#--------------------------------
# Build non-pgo version
#--------------------------------

rm ./build/*.a

clang-8 -c \
      -O3 \
      -ffunction-sections -fdata-sections \
      -o ./build/opaque.o \
      opaque.c

ar rsc ./build/libopaque.a ./build/opaque.o

clang-8 -O3 -c -o ./build/opt_lib.o \
      -ffunction-sections -fdata-sections \
      opt_lib.c

ar rsc ./build/libopt_lib.a ./build/opt_lib.o

clang-8 -O3 -fuse-ld=$LINKER \
      -ffunction-sections -fdata-sections \
      -o ./build/non_pgo \
      branch_weights.c \
      -L ./build \
      -lopt_lib \
      -lopaque

perf stat ./build/non_pgo 2>&1 | tee outputs/non_pgo.stats
perf stat ./build/pgo_use 2>&1 | tee outputs/pgo_use.stats

hyperfine --warmup 5 ./build/non_pgo
hyperfine --warmup 5 ./build/pgo_use

objdump -h ./build/pgo_gen | rg __llvm_prf_data
