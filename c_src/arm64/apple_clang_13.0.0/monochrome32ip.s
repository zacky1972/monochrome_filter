	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_monochrome32ip                 ; -- Begin function monochrome32ip
	.p2align	2
_monochrome32ip:                        ; @monochrome32ip
	.cfi_startproc
; %bb.0:
	mov	w8, #5767
	movk	w8, #16025, lsl #16
	dup.4s	v0, w8
	ld3.16b	{ v16, v17, v18 }, [x1]
	ushll.8h	v3, v16, #0
	ushll.8h	v4, v17, #0
	ushll.4s	v1, v3, #0
	ucvtf.4s	v1, v1
	ushll.4s	v2, v4, #0
	ucvtf.4s	v2, v2
	fmul.4s	v5, v1, v0
	ushll.8h	v6, v18, #0
	mov	w8, #17826
	movk	w8, #16150, lsl #16
	dup.4s	v1, w8
	fmul.4s	v2, v2, v1
	fadd.4s	v5, v2, v5
	ushll.4s	v2, v6, #0
	ucvtf.4s	v7, v2
	mov	w8, #30933
	movk	w8, #15849, lsl #16
	dup.4s	v2, w8
	fmul.4s	v7, v7, v2
	fadd.4s	v5, v7, v5
	ushll2.4s	v3, v3, #0
	ucvtf.4s	v3, v3
	ushll2.4s	v4, v4, #0
	ucvtf.4s	v4, v4
	fmul.4s	v3, v3, v0
	fmul.4s	v4, v4, v1
	fadd.4s	v3, v4, v3
	ushll2.4s	v4, v6, #0
	ucvtf.4s	v4, v4
	fmul.4s	v4, v4, v2
	fadd.4s	v4, v4, v3
	fcvtnu.4s	v3, v5
	xtn.4h	v3, v3
	fcvtnu.4s	v4, v4
	xtn2.8h	v3, v4
	ushll2.8h	v4, v18, #0
	ushll2.8h	v5, v17, #0
	ushll2.8h	v6, v16, #0
	cmp	x0, #17                         ; =17
	b.lo	LBB0_3
; %bb.1:
	add	x8, x1, #48                     ; =48
	mov	w9, #16
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ld3.16b	{ v16, v17, v18 }, [x8], #48
	ushll.4s	v7, v6, #0
	ucvtf.4s	v7, v7
	ushll.4s	v19, v5, #0
	ucvtf.4s	v19, v19
	fmul.4s	v7, v7, v0
	fmul.4s	v19, v19, v1
	fadd.4s	v7, v7, v19
	ushll.4s	v19, v4, #0
	ucvtf.4s	v19, v19
	ushll.8h	v20, v16, #0
	ushll.8h	v21, v17, #0
	fmul.4s	v19, v19, v2
	fadd.4s	v7, v19, v7
	ushll2.4s	v6, v6, #0
	ucvtf.4s	v6, v6
	ushll2.4s	v5, v5, #0
	ucvtf.4s	v5, v5
	fmul.4s	v6, v6, v0
	ushll.4s	v19, v20, #0
	ucvtf.4s	v19, v19
	ushll.4s	v22, v21, #0
	ucvtf.4s	v22, v22
	fmul.4s	v19, v19, v0
	fmul.4s	v5, v5, v1
	fadd.4s	v5, v6, v5
	ushll2.4s	v4, v4, #0
	ucvtf.4s	v4, v4
	fmul.4s	v4, v4, v2
	fadd.4s	v4, v4, v5
	ushll.8h	v5, v18, #0
	fmul.4s	v6, v22, v1
	fadd.4s	v6, v6, v19
	ushll.4s	v19, v5, #0
	ucvtf.4s	v19, v19
	fcvtnu.4s	v7, v7
	xtn.4h	v7, v7
	fcvtnu.4s	v4, v4
	xtn2.8h	v7, v4
	xtn.8b	v22, v3
	xtn2.16b	v22, v7
	mov.16b	v23, v22
	mov.16b	v24, v22
	fmul.4s	v3, v19, v2
	fadd.4s	v3, v3, v6
	ushll2.4s	v4, v20, #0
	ucvtf.4s	v4, v4
	st3.16b	{ v22, v23, v24 }, [x2], #48
	ushll2.4s	v6, v21, #0
	ucvtf.4s	v6, v6
	fmul.4s	v4, v4, v0
	fmul.4s	v6, v6, v1
	fadd.4s	v4, v6, v4
	ushll2.4s	v5, v5, #0
	ucvtf.4s	v5, v5
	fmul.4s	v5, v5, v2
	fadd.4s	v4, v5, v4
	fcvtnu.4s	v3, v3
	xtn.4h	v3, v3
	fcvtnu.4s	v4, v4
	xtn2.8h	v3, v4
	add	x9, x9, #16                     ; =16
	ushll2.8h	v4, v18, #0
	ushll2.8h	v5, v17, #0
	ushll2.8h	v6, v16, #0
	cmp	x9, x0
	b.lo	LBB0_2
LBB0_3:
	ushll.4s	v7, v6, #0
	ucvtf.4s	v7, v7
	ushll.4s	v16, v5, #0
	ucvtf.4s	v16, v16
	fmul.4s	v7, v7, v0
	fmul.4s	v16, v16, v1
	fadd.4s	v7, v7, v16
	ushll.4s	v16, v4, #0
	ucvtf.4s	v16, v16
	fmul.4s	v16, v16, v2
	fadd.4s	v7, v16, v7
	ushll2.4s	v6, v6, #0
	ucvtf.4s	v6, v6
	ushll2.4s	v5, v5, #0
	ucvtf.4s	v5, v5
	fmul.4s	v0, v6, v0
	fmul.4s	v1, v5, v1
	fadd.4s	v0, v0, v1
	ushll2.4s	v1, v4, #0
	ucvtf.4s	v1, v1
	fmul.4s	v1, v1, v2
	fadd.4s	v0, v1, v0
	fcvtnu.4s	v1, v7
	xtn.4h	v1, v1
	fcvtnu.4s	v0, v0
	xtn2.8h	v1, v0
	xtn.8b	v2, v3
	xtn2.16b	v2, v1
	mov.16b	v3, v2
	mov.16b	v4, v2
	st3.16b	{ v2, v3, v4 }, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
