; ModuleID = 'branch_weights.7rcbfp3g-cgu.0'
source_filename = "branch_weights.7rcbfp3g-cgu.0"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"unwind::libunwind::_Unwind_Exception" = type { [0 x i64], i64, [0 x i64], void (i32, %"unwind::libunwind::_Unwind_Exception"*)*, [0 x i64], [6 x i64], [0 x i64] }
%"unwind::libunwind::_Unwind_Context" = type { [0 x i8] }

@vtable.0 = private unnamed_addr constant { void (i8**)*, i64, i64, i32 (i8**)*, i32 (i8**)*, i32 (i8**)* } { void (i8**)* @_ZN4core3ptr18real_drop_in_place17hb4ac17a9c8ec435bE, i64 8, i64 8, i32 (i8**)* @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he98b394592adf299E", i32 (i8**)* @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he98b394592adf299E", i32 (i8**)* @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h0b1949f3508b6cbeE" }, align 8
@0 = private unnamed_addr constant <{ [1000 x i8] }> <{ [1000 x i8] c"\1C\12C9\17\0C-)\08^[.3\22<Ba\10::,A`4^\0BJ]c?JK*%/\0D4ET\00AV7\05\19M>I[!#2@\12%\1D2SV :R`R\1F$._D\12*\1F\11(8P<cM\08d\16\0CH7/Yc4\1D`\1CL5\1D2^\0A=\07\070#\5C05]'\15<\0A1b\1AO\0FV\17+'Y \0E!F\19\1E\5C_\0FR)Y\1BQ2W\04J_!\15a94:\137\16$\22\05\01\03\08D\1A'FRN\05?\14\03(c9\0A\0A\08#\06\18GY\020\112\0Fd%&JJ\00&\5C3%M\5CHZXTRA\06VX'\08,\11&\18\08^<\0A#C,\1F\06_\01J\15.WK\03S\0B1 2$I5\1F!C\1A$X]K^\10\0Dd11\22\1DV\0Ad\159^EK `3/\09S8$\1EEH\16P\5CaL2\1D)\1C55\12HFYQ8X\11b\03\14\138:@54c\13\0F\02'SN\145\1A-CR6\07\10JT\0A-\132O\10&)Db`*\11OSNW\13*A\14]\1FY\13\10\04\0B1E2 2O#\11\07S\5C\1E>\04a\1F1V5JO\14C\12?.(^\19a-\14\17R\08IcS/!VSX\1EKSd9\5CR\03.\06W[]dS8H\18\0DG\0D\1F\14c[\0F\11;G?\1F\0FY\08\06\0D\09*6#H!&\01<&P8@:IW\22\03]&2>B\1F.,J VM'\14@9\19TCM\09c%(\17\1C(+5a\18/Q-_\0F#_F\22Z\19**34^BSGFa]\0Ecdd\15?#\0F ,:V/\17WMY\09\11#\00\08PY0\11\11B6LA\06-#RU[WV\12;\13\12\10\16W\19J&C\01\07-\00\1D\12\1E\22)94,DW]\1Ed\15K8b2\0FB\05#\0D\1EUaR3\05O\02`\17%\05\1D`\10\19\04P@\16X\0B@\1B\00-\15\03Q\016F\1E\10O\09^\0EQ2&4\0D,]\10.\10\04SSX8T\222\5C\1AV6I\1F\10LBW\16\1F`.\13\22>1\14:+\184F1\1E+\0BP1-\0CD \12FOZ\1A\1C\1E;\180\0A4\10?JVcB\1D1?4]A\0F_=% 4-\13I\15N+G[S5\14=@] !Q$G\17I\03a\06\08\01\01?\1D\0AS)\0AY\10\16`1\1A\19N_X\1D/^(bU\0A\19c;\1A:\11\09R\177A\0B\10-&d\181`[\19\0E\1B?\0D?\15K\19_H\05I5EF\17\10A&2\054T>\02J^U=8\00OX2\0D\06$ \06F$@B\01#L\01\05\00N\0C/:RD\0BVK.\0DA69 \147\00>^:[D\0A\10\12G\09<\1DR5U-\08J\10M \1EV7\03;21%P\0DPG\14>2U7]\19\1BP'\1A\15\06[\0EJ$]ETZL\0A\0AWN\18L\5C;@M@TX\141>\02\19\14\22\0FaHT9];\15\22+\09[+.\227\1B8T\19R\05\0F[O\01^'\0FD<\08.*\10JO\09'\22MA\1FT\01\06b\1A,\11.>b\22\1CX\07\0EF=\04-\0CF\13BP\0E\02\11E\11\11\05\09\1D.\0F\018O<`\01\062\0D\16\00_\01\14dI0_YN" }>, align 1

; std::rt::lang_start
; Function Attrs: cold nonlazybind uwtable
define hidden i64 @_ZN3std2rt10lang_start17hd1c20e3ad823dc43E(void ()* nonnull %main, i64 %argc, i8** %argv) unnamed_addr #0 !prof !29 {
start:
  %_7 = alloca i8*, align 8
  %0 = bitcast i8** %_7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0)
  %1 = bitcast i8** %_7 to void ()**
  store void ()* %main, void ()** %1, align 8
  %2 = bitcast i8** %_7 to {}*
; call std::rt::lang_start_internal
  %3 = call i64 @_ZN3std2rt19lang_start_internal17h1e399ade45c9de08E({}* nonnull align 1 %2, [3 x i64]* noalias readonly align 8 dereferenceable(24) bitcast ({ void (i8**)*, i64, i64, i32 (i8**)*, i32 (i8**)*, i32 (i8**)* }* @vtable.0 to [3 x i64]*), i64 %argc, i8** %argv)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0)
  ret i64 %3
}

; std::rt::lang_start::{{closure}}
; Function Attrs: cold nonlazybind uwtable
define internal i32 @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he98b394592adf299E"(i8** noalias nocapture readonly align 8 dereferenceable(8) %arg0) unnamed_addr #0 !prof !30 !PGOFuncName !31 {
start:
  %0 = bitcast i8** %arg0 to void ()**
  %1 = load void ()*, void ()** %0, align 8, !nonnull !32
  tail call void %1(), !prof !33
  ret i32 0
}

; core::ops::function::FnOnce::call_once{{vtable.shim}}
; Function Attrs: cold nonlazybind uwtable
define internal i32 @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h0b1949f3508b6cbeE"(i8** nocapture readonly %arg0) unnamed_addr #0 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality !prof !29 {
start:
  %0 = bitcast i8** %arg0 to void ()**
  %1 = load void ()*, void ()** %0, align 8, !nonnull !32
  tail call void %1(), !noalias !34
  ret i32 0
}

; core::ptr::real_drop_in_place
; Function Attrs: cold norecurse nounwind nonlazybind readnone uwtable
define internal void @_ZN4core3ptr18real_drop_in_place17hb4ac17a9c8ec435bE(i8** nocapture align 8 dereferenceable(8) %arg0) unnamed_addr #1 !prof !29 {
start:
  ret void
}

; branch_weights::main
; Function Attrs: nonlazybind uwtable
define internal void @_ZN14branch_weights4main17h07d5948c005dd499E() unnamed_addr #2 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality !prof !30 !PGOFuncName !37 {
start:
  br label %bb6

bb4:                                              ; preds = %bb6
  ret void

bb6:                                              ; preds = %bb6, %start
  %iter.sroa.0.09 = phi i32 [ 0, %start ], [ %iter.sroa.0.1, %bb6 ]
  %iter.sroa.0.1 = add nuw nsw i32 %iter.sroa.0.09, 1
; call opt_lib::do_the_loop
  tail call void @_ZN7opt_lib11do_the_loop17hc0c46794e6198059E([0 x i8]* noalias nonnull readonly align 1 bitcast (<{ [1000 x i8] }>* @0 to [0 x i8]*), i64 1000, i64 1000)
  %exitcond = icmp eq i32 %iter.sroa.0.1, 100000
  br i1 %exitcond, label %bb4, label %bb6, !prof !38
}

; std::rt::lang_start_internal
; Function Attrs: nonlazybind uwtable
declare i64 @_ZN3std2rt19lang_start_internal17h1e399ade45c9de08E({}* nonnull align 1, [3 x i64]* noalias readonly align 8 dereferenceable(24), i64, i8**) unnamed_addr #2

; Function Attrs: nounwind nonlazybind uwtable
declare i32 @rust_eh_personality(i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*) unnamed_addr #3

; opt_lib::do_the_loop
; Function Attrs: nonlazybind uwtable
declare void @_ZN7opt_lib11do_the_loop17hc0c46794e6198059E([0 x i8]* noalias nonnull readonly align 1, i64, i64) unnamed_addr #2

; Function Attrs: cold nonlazybind
define i32 @main(i32, i8**) unnamed_addr #4 !prof !30 {
top:
  %_7.i = alloca i8*, align 8
  %2 = sext i32 %0 to i64
  %3 = bitcast i8** %_7.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3)
  %4 = bitcast i8** %_7.i to void ()**
  store void ()* @_ZN14branch_weights4main17h07d5948c005dd499E, void ()** %4, align 8
  %5 = bitcast i8** %_7.i to {}*
; call std::rt::lang_start_internal
  %6 = call i64 @_ZN3std2rt19lang_start_internal17h1e399ade45c9de08E({}* nonnull align 1 %5, [3 x i64]* noalias readonly align 8 dereferenceable(24) bitcast ({ void (i8**)*, i64, i64, i32 (i8**)*, i32 (i8**)*, i32 (i8**)* }* @vtable.0 to [3 x i64]*), i64 %2, i8** %1)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3)
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #5

attributes #0 = { cold nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #1 = { cold norecurse nounwind nonlazybind readnone uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #2 = { nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #3 = { nounwind nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #4 = { cold nonlazybind "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #5 = { argmemonly nounwind }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 7, !"PIE Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{i32 1, !"ProfileSummary", !3}
!3 = !{!4, !5, !6, !7, !8, !9, !10, !11}
!4 = !{!"ProfileFormat", !"InstrProf"}
!5 = !{!"TotalCount", i64 1000030}
!6 = !{!"MaxCount", i64 1000000}
!7 = !{!"MaxInternalCount", i64 10}
!8 = !{!"MaxFunctionCount", i64 1000000}
!9 = !{!"NumCounts", i64 7}
!10 = !{!"NumFunctions", i64 6}
!11 = !{!"DetailedSummary", !12}
!12 = !{!13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28}
!13 = !{i32 10000, i64 1000000, i32 1}
!14 = !{i32 100000, i64 1000000, i32 1}
!15 = !{i32 200000, i64 1000000, i32 1}
!16 = !{i32 300000, i64 1000000, i32 1}
!17 = !{i32 400000, i64 1000000, i32 1}
!18 = !{i32 500000, i64 1000000, i32 1}
!19 = !{i32 600000, i64 1000000, i32 1}
!20 = !{i32 700000, i64 1000000, i32 1}
!21 = !{i32 800000, i64 1000000, i32 1}
!22 = !{i32 900000, i64 1000000, i32 1}
!23 = !{i32 950000, i64 1000000, i32 1}
!24 = !{i32 990000, i64 1000000, i32 1}
!25 = !{i32 999000, i64 1000000, i32 1}
!26 = !{i32 999900, i64 1000000, i32 1}
!27 = !{i32 999990, i64 10, i32 4}
!28 = !{i32 999999, i64 10, i32 4}
!29 = !{!"function_entry_count", i64 0}
!30 = !{!"function_entry_count", i64 10}
!31 = !{!"branch_weights.7rcbfp3g-cgu.0:_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he98b394592adf299E"}
!32 = !{}
!33 = !{!"VP", i32 0, i64 10, i64 -3540770189133163840, i64 1, i64 0, i64 1, i64 0, i64 1}
!34 = !{!35}
!35 = distinct !{!35, !36, !"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he98b394592adf299E: %arg0"}
!36 = distinct !{!36, !"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he98b394592adf299E"}
!37 = !{!"branch_weights.7rcbfp3g-cgu.0:_ZN14branch_weights4main17h07d5948c005dd499E"}
!38 = !{!"branch_weights", i32 10, i32 1000000}
