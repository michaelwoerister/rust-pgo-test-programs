; ModuleID = 'opt_lib.3a1fbbbh-cgu.0'
source_filename = "opt_lib.3a1fbbbh-cgu.0"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

$__llvm_profile_filename = comdat any

@str.0 = internal constant [10 x i8] c"opt_lib.rs"
@panic_bounds_check_loc.1 = private unnamed_addr constant { { [0 x i8]*, i64 }, i32, i32 } { { [0 x i8]*, i64 } { [0 x i8]* bitcast ([10 x i8]* @str.0 to [0 x i8]*), i64 10 }, i32 12, i32 19 }, align 8
@__llvm_profile_raw_version = local_unnamed_addr constant i64 72057594037927940, comdat
@__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__ZN7opt_lib11do_the_loop17hc0c46794e6198059E = private global { i64, i64, i64*, i8*, i8*, i32, [2 x i16] } { i64 -4690161384989577213, i64 58173295233, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i32 0, i32 0), i8* bitcast (void ([0 x i8]*, i64, i64)* @_ZN7opt_lib11do_the_loop17hc0c46794e6198059E to i8*), i8* null, i32 4, [2 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [46 x i8] c",\00_ZN7opt_lib11do_the_loop17hc0c46794e6198059E", section "__llvm_prf_names"
@__llvm_profile_filename = local_unnamed_addr constant [72 x i8] c"/xoxo/rust-pgo-test-programs/branch_weights/profdata/default_%m.profraw\00", comdat
@llvm.used = appending global [2 x i8*] [i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__llvm_prf_nm, i32 0, i32 0), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [2 x i16] }* @__profd__ZN7opt_lib11do_the_loop17hc0c46794e6198059E to i8*)], section "llvm.metadata"

; opt_lib::do_the_loop
; Function Attrs: nonlazybind uwtable
define void @_ZN7opt_lib11do_the_loop17hc0c46794e6198059E([0 x i8]* noalias nocapture nonnull readonly align 1, i64, i64 %len) unnamed_addr #0 {
start:
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 2), align 8
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 2), align 8
  %3 = icmp eq i64 %len, 0
  br i1 %3, label %bb3, label %bb2

bb2:                                              ; preds = %start, %bb9
  %pgocount1016 = phi i64 [ %pgocount1015, %bb9 ], [ 0, %start ]
  %pgocount913 = phi i64 [ %pgocount912, %bb9 ], [ 0, %start ]
  %i.08 = phi i64 [ %13, %bb9 ], [ 0, %start ]
  %4 = icmp ult i64 %i.08, %1
  br i1 %4, label %bb4, label %panic, !prof !1

bb1.bb3_crit_edge:                                ; preds = %bb9
  %pgocount.promoted14 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 0), align 8
  %5 = add i64 %pgocount.promoted14, %pgocount912
  store i64 %5, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 0), align 8
  %pgocount.promoted18 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 1), align 8
  %6 = add i64 %pgocount.promoted18, %pgocount1015
  store i64 %6, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 1), align 8
  br label %bb3

bb3:                                              ; preds = %start, %bb1.bb3_crit_edge
  ret void

bb4:                                              ; preds = %bb2
  %7 = getelementptr inbounds [0 x i8], [0 x i8]* %0, i64 0, i64 %i.08
  %8 = load i8, i8* %7, align 1
  %9 = icmp ult i8 %8, 20
  br i1 %9, label %bb6, label %bb5

bb5:                                              ; preds = %bb4
  %10 = add i64 %pgocount913, 1
; call opaque::opaque2
  %11 = tail call i16 @_ZN6opaque7opaque217haa47a1a064db8b6aE(i8 %8)
  br label %bb9

bb6:                                              ; preds = %bb4
  %12 = add i64 %pgocount1016, 1
; call opaque::opaque1
  tail call void @_ZN6opaque7opaque117h2ca9b82fba8f4468E(i8 %8)
  br label %bb9

bb9:                                              ; preds = %bb5, %bb6
  %pgocount1015 = phi i64 [ %pgocount1016, %bb5 ], [ %12, %bb6 ]
  %pgocount912 = phi i64 [ %10, %bb5 ], [ %pgocount913, %bb6 ]
  %13 = add nuw i64 %i.08, 1
  %14 = icmp ult i64 %13, %len
  br i1 %14, label %bb2, label %bb1.bb3_crit_edge

panic:                                            ; preds = %bb2
  %pgocount.promoted = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 0), align 8
  %15 = add i64 %pgocount.promoted, %pgocount913
  store i64 %15, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 0), align 8
  %pgocount.promoted17 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 1), align 8
  %16 = add i64 %pgocount.promoted17, %pgocount1016
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 1), align 8
  %pgocount11 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 3), align 8
  %17 = add i64 %pgocount11, 1
  store i64 %17, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__ZN7opt_lib11do_the_loop17hc0c46794e6198059E, i64 0, i64 3), align 8
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

attributes #0 = { nonlazybind uwtable "target-cpu"="x86-64" }
attributes #1 = { cold noinline noreturn nonlazybind uwtable "target-cpu"="x86-64" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"RtLibUseGOT", i32 1}
!1 = !{!"branch_weights", i32 2000, i32 1}
