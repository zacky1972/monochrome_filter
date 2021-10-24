	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0
	.globl	_monochrome32i                  ; -- Begin function monochrome32i
	.p2align	2
_monochrome32i:                         ; @monochrome32i
	.cfi_startproc
; %bb.0:                                ; %entry
	cbz	x0, LBB0_3
; %bb.1:                                ; %for.body.preheader
	mov	x8, #0
	mov	w9, #5767
	movk	w9, #16025, lsl #16
	dup.4s	v0, w9
	mov	w9, #17826
	movk	w9, #16150, lsl #16
	dup.4s	v1, w9
	mov	w9, #30933
	movk	w9, #15849, lsl #16
	dup.4s	v2, w9
LBB0_2:                                 ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	ld3.16b	{ v3, v4, v5 }, [x1], #48
	ushll.8h	v6, v3, #0
	ushll.8h	v7, v4, #0
	ushll2.8h	v16, v3, #0
	ushll2.8h	v17, v4, #0
	ushll.4s	v18, v6, #0
	ucvtf.4s	v18, v18
	ushll.4s	v19, v7, #0
	ucvtf.4s	v19, v19
	fmul.4s	v18, v18, v0
	ushll.8h	v20, v5, #0
	ushll2.8h	v3, v5, #0
	fmul.4s	v4, v19, v1
	ushll.4s	v5, v20, #0
	ucvtf.4s	v5, v5
	fmul.4s	v5, v5, v2
	ushll2.4s	v6, v6, #0
	ucvtf.4s	v6, v6
	ushll2.4s	v7, v7, #0
	ucvtf.4s	v7, v7
	fmul.4s	v6, v6, v0
	fadd.4s	v4, v4, v18
	fmul.4s	v7, v7, v1
	fadd.4s	v6, v7, v6
	ushll2.4s	v7, v20, #0
	ucvtf.4s	v7, v7
	fmul.4s	v7, v7, v2
	fadd.4s	v4, v5, v4
	ushll.4s	v5, v16, #0
	ucvtf.4s	v5, v5
	ushll.4s	v18, v17, #0
	ucvtf.4s	v18, v18
	fmul.4s	v5, v5, v0
	fadd.4s	v6, v7, v6
	fmul.4s	v7, v18, v1
	fadd.4s	v5, v7, v5
	ushll.4s	v7, v3, #0
	ucvtf.4s	v7, v7
	fmul.4s	v7, v7, v2
	fcvtnu.4s	v4, v4
	fadd.4s	v5, v7, v5
	ushll2.4s	v7, v16, #0
	ucvtf.4s	v7, v7
	ushll2.4s	v16, v17, #0
	ucvtf.4s	v16, v16
	fcvtnu.4s	v6, v6
	fmul.4s	v7, v7, v0
	fmul.4s	v16, v16, v1
	fadd.4s	v7, v16, v7
	ushll2.4s	v3, v3, #0
	ucvtf.4s	v3, v3
	xtn.4h	v4, v4
	fmul.4s	v3, v3, v2
	fadd.4s	v3, v3, v7
	fcvtnu.4s	v5, v5
	xtn.4h	v5, v5
	fcvtnu.4s	v3, v3
	xtn2.8h	v4, v6
	xtn2.8h	v5, v3
	xtn.8b	v16, v4
	xtn2.16b	v16, v5
	mov.16b	v17, v16
	mov.16b	v18, v16
	st3.16b	{ v16, v17, v18 }, [x2], #48
	add	x8, x8, #16                     ; =16
	cmp	x8, x0
	b.lo	LBB0_2
LBB0_3:                                 ; %for.cond.cleanup
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
