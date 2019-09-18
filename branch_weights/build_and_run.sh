#!/bin/sh

CWD=$(pwd)

LINKER=bfd

COMMON_ARGS="--emit=llvm-ir,link \
             -C opt-level=3 \
             -L ./build \
             -C codegen-units=1 \
             --out-dir=./build \
             -Clinker=clang-8 \
             -Clink-args=-fuse-ld=$LINKER"

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
      branch_weights.rs

mv build/opt_lib.ll outputs/opt_lib_gen.$LINKER.ll
mv build/branch_weights.ll outputs/pgo_gen.$LINKER.ll
mv build/branch_weights outputs/pgo_gen.$LINKER


#--------------------------------
# Collect profile
#--------------------------------
./outputs/pgo_gen.$LINKER > /dev/null
./outputs/pgo_gen.$LINKER > /dev/null
./outputs/pgo_gen.$LINKER > /dev/null
./outputs/pgo_gen.$LINKER > /dev/null
./outputs/pgo_gen.$LINKER > /dev/null
./outputs/pgo_gen.$LINKER > /dev/null
./outputs/pgo_gen.$LINKER > /dev/null
./outputs/pgo_gen.$LINKER > /dev/null
./outputs/pgo_gen.$LINKER > /dev/null
./outputs/pgo_gen.$LINKER > /dev/null

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
      -C llvm-args="-pgo-warn-missing-function" \
      opaque.rs

rustc $COMMON_ARGS \
      -C profile-use=$CWD/profdata/merged.profdata \
      -C llvm-args="-pgo-warn-missing-function" \
      opt_lib.rs

rustc $COMMON_ARGS \
      -C profile-use=$CWD/profdata/merged.profdata \
      -C llvm-args="-pgo-warn-missing-function" \
      branch_weights.rs

# cd build
# llvm-dis pgo_use.pgo_use.7rcbfp3g-cgu.0.rcgu.bc
# llvm-dis pgo_use.pgo_use.7rcbfp3g-cgu.0.rcgu.no-opt.bc
# mv pgo_use.pgo_use.7rcbfp3g-cgu.0.rcgu.ll ../opt.ll
# mv pgo_use.pgo_use.7rcbfp3g-cgu.0.rcgu.no-opt.ll ../no-opt.ll
# cd ..

mv build/opt_lib.ll outputs/opt_lib_use.$LINKER.ll
mv build/branch_weights.ll outputs/pgo_use.$LINKER.ll
mv build/branch_weights outputs/pgo_use.$LINKER

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
      branch_weights.rs

mv build/opt_lib.ll outputs/opt_lib_non_pgo.$LINKER.ll
mv build/branch_weights outputs/non_pgo.$LINKER

perf stat ./outputs/pgo_use.$LINKER 2>&1 | tee outputs/non_pgo.$LINKER.stats
perf stat ./outputs/non_pgo.$LINKER 2>&1 | tee outputs/pgo_use.$LINKER.stats

hyperfine --warmup 5 ./outputs/non_pgo.$LINKER
hyperfine --warmup 5 ./outputs/pgo_use.$LINKER
