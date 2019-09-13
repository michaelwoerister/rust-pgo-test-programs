#!/bin/sh

CWD=$(pwd)

rm -rf $CWD/profdata
rm -rf $CWD/build

mkdir -p $CWD/profdata
mkdir -p $CWD/build

rustup override set 0-rust-2

rustc --emit=llvm-ir,link \
      --crate-type=rlib \
      -C opt-level=3 \
      --out-dir ./build \
      opaque.rs

rustc --emit=llvm-ir,link \
      -C profile-generate=$CWD/profdata \
      -C opt-level=3 \
      -L ./build \
      --crate-name=pgo_gen \
      --crate-type=bin \
      --out-dir ./build \
      branch_weights.rs

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

rustc --emit=llvm-ir,link \
      -C profile-use=$CWD/profdata/merged.profdata \
      -C opt-level=3 \
      -L ./build \
      --crate-type=bin \
      --crate-name=pgo_use \
      --out-dir ./build \
      branch_weights.rs

rustc --emit=llvm-ir,link \
      -C opt-level=3 \
      -L ./build \
      --crate-type=bin \
      --crate-name=non_pgo \
      --out-dir ./build \
      branch_weights.rs
