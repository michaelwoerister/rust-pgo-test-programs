; ModuleID = 'opt_lib.3a1fbbbh-cgu.0'
source_filename = "opt_lib.3a1fbbbh-cgu.0"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str.0 = internal constant [10 x i8] c"opt_lib.rs"
@panic_bounds_check_loc.1 = private unnamed_addr constant { { [0 x i8]*, i64 }, i32, i32 } { { [0 x i8]*, i64 } { [0 x i8]* bitcast ([10 x i8]* @str.0 to [0 x i8]*), i64 10 }, i32 12, i32 19 }, align 8

; opt_lib::do_the_loop
; Function Attrs: nonlazybind uwtable
define void @_ZN7opt_lib11do_the_loop17hc0c46794e6198059E([0 x i8]* noalias nocapture nonnull readonly align 1, i64, i64 %len) unnamed_addr #0 !prof !28 {
start:
  %2 = icmp eq i64 %len, 0
  br i1 %2, label %bb3, label %bb2, !prof !29

bb2:                                              ; preds = %start, %bb9
  %i.08 = phi i64 [ %8, %bb9 ], [ 0, %start ]
  %3 = icmp ult i64 %i.08, %1
  br i1 %3, label %bb4, label %panic, !prof !30

bb3:                                              ; preds = %bb9, %start
  ret void

bb4:                                              ; preds = %bb2
  %4 = getelementptr inbounds [0 x i8], [0 x i8]* %0, i64 0, i64 %i.08
  %5 = load i8, i8* %4, align 1
  %6 = icmp ult i8 %5, 20
  br i1 %6, label %bb6, label %bb5, !prof !31

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
  br i1 %9, label %bb2, label %bb3, !prof !32

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

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"RtLibUseGOT", i32 1}
!1 = !{i32 1, !"ProfileSummary", !2}
!2 = !{!3, !4, !5, !6, !7, !8, !9, !10}
!3 = !{!"ProfileFormat", !"InstrProf"}
!4 = !{!"TotalCount", i64 1002000030}
!5 = !{!"MaxCount", i64 793000000}
!6 = !{!"MaxInternalCount", i64 207000000}
!7 = !{!"MaxFunctionCount", i64 793000000}
!8 = !{!"NumCounts", i64 11}
!9 = !{!"NumFunctions", i64 7}
!10 = !{!"DetailedSummary", !11}
!11 = !{!12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27}
!12 = !{i32 10000, i64 793000000, i32 1}
!13 = !{i32 100000, i64 793000000, i32 1}
!14 = !{i32 200000, i64 793000000, i32 1}
!15 = !{i32 300000, i64 793000000, i32 1}
!16 = !{i32 400000, i64 793000000, i32 1}
!17 = !{i32 500000, i64 793000000, i32 1}
!18 = !{i32 600000, i64 793000000, i32 1}
!19 = !{i32 700000, i64 793000000, i32 1}
!20 = !{i32 800000, i64 207000000, i32 2}
!21 = !{i32 900000, i64 207000000, i32 2}
!22 = !{i32 950000, i64 207000000, i32 2}
!23 = !{i32 990000, i64 207000000, i32 2}
!24 = !{i32 999000, i64 1000000, i32 4}
!25 = !{i32 999900, i64 1000000, i32 4}
!26 = !{i32 999990, i64 1000000, i32 4}
!27 = !{i32 999999, i64 1000000, i32 4}
!28 = !{!"function_entry_count", i64 1000000}
!29 = !{!"branch_weights", i32 1000000, i32 1000000000}
!30 = !{!"branch_weights", i32 1000000000, i32 0}
!31 = !{!"branch_weights", i32 207000000, i32 793000000}
!32 = !{!"branch_weights", i32 1000000000, i32 1000000}
