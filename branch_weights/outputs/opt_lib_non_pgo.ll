; ModuleID = 'opt_lib.3a1fbbbh-cgu.0'
source_filename = "opt_lib.3a1fbbbh-cgu.0"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str.0 = internal constant [10 x i8] c"opt_lib.rs"
@panic_bounds_check_loc.1 = private unnamed_addr constant { { [0 x i8]*, i64 }, i32, i32 } { { [0 x i8]*, i64 } { [0 x i8]* bitcast ([10 x i8]* @str.0 to [0 x i8]*), i64 10 }, i32 13, i32 19 }, align 8

; opt_lib::do_the_loop
; Function Attrs: nonlazybind uwtable
define void @_ZN7opt_lib11do_the_loop17hc0c46794e6198059E([0 x i8]* noalias nocapture nonnull readonly align 1, i64, i64 %len) unnamed_addr #0 {
start:
  %2 = icmp eq i64 %len, 0
  br i1 %2, label %bb3, label %bb2

bb2:                                              ; preds = %start, %bb9
  %i.08 = phi i64 [ %8, %bb9 ], [ 0, %start ]
  %3 = icmp ult i64 %i.08, %1
  br i1 %3, label %bb4, label %panic, !prof !1

bb3:                                              ; preds = %bb9, %start
  ret void

bb4:                                              ; preds = %bb2
  %4 = getelementptr inbounds [0 x i8], [0 x i8]* %0, i64 0, i64 %i.08
  %5 = load i8, i8* %4, align 1
  %6 = icmp ult i8 %5, 20
  br i1 %6, label %bb6, label %bb5

bb5:                                              ; preds = %bb4
; call opaque::opaque2
  %7 = tail call i16 @_ZN6opaque7opaque217haa47a1a064db8b6aE(i8 %5)
  br label %bb9

bb6:                                              ; preds = %bb4
; call opaque::opaque1
  tail call void @_ZN6opaque7opaque117h2ca9b82fba8f4468E(i8 %5)
  br label %bb9

bb9:                                              ; preds = %bb5, %bb6
  %8 = add nuw i64 %i.08, 1
  %9 = icmp ult i64 %8, %len
  br i1 %9, label %bb2, label %bb3

panic:                                            ; preds = %bb2
; call core::panicking::panic_bounds_check
  tail call void @_ZN4core9panicking18panic_bounds_check17h8ee9a081f22190d8E({ [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }* noalias readonly align 8 dereferenceable(24) bitcast ({ { [0 x i8]*, i64 }, i32, i32 }* @panic_bounds_check_loc.1 to { [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }*), i64 %i.08, i64 %1)
  unreachable
}

; core::panicking::panic_bounds_check
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_ZN4core9panicking18panic_bounds_check17h8ee9a081f22190d8E({ [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }* noalias readonly align 8 dereferenceable(24), i64, i64) unnamed_addr #1

; opaque::opaque1
; Function Attrs: nonlazybind uwtable
declare void @_ZN6opaque7opaque117h2ca9b82fba8f4468E(i8) unnamed_addr #0

; opaque::opaque2
; Function Attrs: nonlazybind uwtable
declare i16 @_ZN6opaque7opaque217haa47a1a064db8b6aE(i8) unnamed_addr #0

attributes #0 = { nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #1 = { cold noinline noreturn nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"RtLibUseGOT", i32 1}
!1 = !{!"branch_weights", i32 2000, i32 1}
