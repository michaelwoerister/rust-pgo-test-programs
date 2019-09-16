#!/bin/sh

CWD=$(pwd)
COMMON_ARGS="--emit=llvm-ir,link,obj \
             -C opt-level=3 \
             -L ./build \
             -C codegen-units=1 \
             --out-dir=./build \
             -Clinker=clang-8 \
             -Clink-args=-fuse-ld=lld"

rm -rf $CWD/profdata
rm -rf $CWD/build

mkdir -p $CWD/profdata
mkdir -p $CWD/build

rustup override set 0-rust-2

rustc --emit=llvm-ir,link \
      -C opt-level=3 \
      --out-dir ./build \
      -C codegen-units=1 \
      opaque.rs


#--------------------------------
# Build the instrumented binary
#--------------------------------
rustc $COMMON_ARGS \
      -C profile-generate=$CWD/profdata \
      opt_lib.rs

rustc $COMMON_ARGS \
      -C profile-generate=$CWD/profdata \
      --crate-name=pgo_gen \
      branch_weights.rs

mv build/opt_lib.ll build/opt_lib_gen.ll

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

rustc $COMMON_ARGS \
      -C profile-use=$CWD/profdata/merged.profdata \
      opt_lib.rs

rustc $COMMON_ARGS \
      -C profile-use=$CWD/profdata/merged.profdata \
      --crate-name=pgo_use \
      branch_weights.rs

mv build/opt_lib.ll build/opt_lib_use.ll

rustc $COMMON_ARGS \
      --crate-name=non_pgo \
      branch_weights.rs


perf stat ./build/non_pgo
perf stat ./build/pgo_use
