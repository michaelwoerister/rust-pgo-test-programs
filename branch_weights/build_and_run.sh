#!/bin/sh

CWD=$(pwd)
COMMON_ARGS="--emit=llvm-ir,link \
             -C opt-level=3 \
             -L ./build \
             -C codegen-units=1 \
             --out-dir=./build \
             -Clinker=clang-8 \
             -Clink-args=-fuse-ld=lld"

rm -rf ./profdata
rm -rf ./build

mkdir -p ./profdata
mkdir -p ./build
mkdir -p ./outputs

rustup override set 0-rust-2

#--------------------------------
# Build the instrumented binary
#--------------------------------
rustc --emit=llvm-ir,link \
      -C opt-level=3 \
      --out-dir ./build \
      -C codegen-units=1 \
      opaque.rs

rustc $COMMON_ARGS \
      -C profile-generate=$CWD/profdata \
      opt_lib.rs

rustc $COMMON_ARGS \
      -C profile-generate=$CWD/profdata \
      --crate-name=pgo_gen \
      branch_weights.rs

mv build/opt_lib.ll outputs/opt_lib_gen.ll



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

rm ./build/*.ll
rm ./build/*.rlib

rustc --emit=llvm-ir,link \
      -C opt-level=3 \
      --out-dir ./build \
      -C codegen-units=1 \
      opaque.rs

rustc $COMMON_ARGS \
      -C profile-use=$CWD/profdata/merged.profdata \
      opt_lib.rs

rustc $COMMON_ARGS \
      -C profile-use=$CWD/profdata/merged.profdata \
      --crate-name=pgo_use \
      branch_weights.rs

mv build/opt_lib.ll outputs/opt_lib_use.ll


#--------------------------------
# Build non-pgo version
#--------------------------------

rm ./build/*.ll
rm ./build/*.rlib

rustc --emit=llvm-ir,link \
      -C opt-level=3 \
      --out-dir ./build \
      -C codegen-units=1 \
      opaque.rs

rustc $COMMON_ARGS \
      opt_lib.rs

rustc $COMMON_ARGS \
      --crate-name=non_pgo \
      branch_weights.rs

mv build/opt_lib.ll outputs/opt_lib_non_pgo.ll

perf stat ./build/non_pgo 2>&1 | tee outputs/non_pgo.stats
perf stat ./build/pgo_use 2>&1 | tee outputs/pgo_use.stats
