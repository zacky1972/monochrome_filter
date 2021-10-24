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
	ld3.16b	{ v5, v6, v7 }, [x1], #48
	ushll.8h	v17, v5, #0
	ext.16b	v3, v5, v5, #8
	ushll.8h	v18, v6, #0
	ext.16b	v4, v6, v6, #8
	ushll.4s	v1, v17, #0
	ucvtf.4s	v1, v1
	ushll.4s	v2, v18, #0
	ucvtf.4s	v2, v2
	fmul.4s	v19, v1, v0
	ushll.8h	v20, v7, #0
	ext.16b	v16, v7, v7, #8
	mov	w8, #17826
	movk	w8, #16150, lsl #16
	dup.4s	v1, w8
	fmul.4s	v2, v2, v1
	fadd.4s	v5, v2, v19
	ushll.4s	v2, v20, #0
	ucvtf.4s	v6, v2
	mov	w8, #30933
	movk	w8, #15849, lsl #16
	dup.4s	v2, w8
	fmul.4s	v6, v6, v2
	fadd.4s	v5, v6, v5
	ushll2.4s	v6, v17, #0
	ucvtf.4s	v6, v6
	ushll2.4s	v7, v18, #0
	ucvtf.4s	v7, v7
	fmul.4s	v6, v6, v0
	fmul.4s	v7, v7, v1
	fadd.4s	v6, v7, v6
	ushll2.4s	v7, v20, #0
	ucvtf.4s	v7, v7
	fmul.4s	v7, v7, v2
	fadd.4s	v6, v7, v6
	fcvtnu.4s	v5, v5
	xtn.4h	v5, v5
	fcvtnu.4s	v6, v6
	xtn2.8h	v5, v6
	mov	w8, #16
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ushll.8h	v19, v16, #0
	ushll.8h	v4, v4, #0
	ushll.8h	v3, v3, #0
	ext.16b	v6, v3, v3, #8
	ushll.4s	v3, v3, #0
	ushll.4s	v18, v6, #0
	ushll2.4s	v17, v4, #0
	ushll2.4s	v16, v19, #0
	xtn.8b	v5, v5
	cmp	x8, x0
	b.hs	LBB0_3
; %bb.2:                                ;   in Loop: Header=BB0_1 Depth=1
	ld3.16b	{ v20, v21, v22 }, [x1], #48
	ucvtf.4s	v3, v3
	ushll.4s	v4, v4, #0
	ucvtf.4s	v4, v4
	fmul.4s	v3, v3, v0
	fmul.4s	v4, v4, v1
	fadd.4s	v23, v3, v4
	ushll.4s	v3, v19, #0
	ucvtf.4s	v19, v3
	ushll.8h	v24, v20, #0
	ext.16b	v3, v20, v20, #8
	ushll.8h	v25, v21, #0
	ext.16b	v4, v21, v21, #8
	fmul.4s	v19, v19, v2
	fadd.4s	v19, v19, v23
	ucvtf.4s	v18, v18
	ucvtf.4s	v17, v17
	fmul.4s	v18, v18, v0
	ushll.4s	v23, v24, #0
	ucvtf.4s	v23, v23
	ushll.4s	v26, v25, #0
	ucvtf.4s	v26, v26
	fmul.4s	v23, v23, v0
	fmul.4s	v17, v17, v1
	fadd.4s	v17, v18, v17
	ucvtf.4s	v16, v16
	fmul.4s	v16, v16, v2
	fadd.4s	v17, v16, v17
	ushll.8h	v18, v22, #0
	ext.16b	v16, v22, v22, #8
	fmul.4s	v20, v26, v1
	fadd.4s	v20, v20, v23
	ushll.4s	v21, v18, #0
	ucvtf.4s	v21, v21
	fcvtnu.4s	v19, v19
	xtn.4h	v19, v19
	fcvtnu.4s	v17, v17
	xtn2.8h	v19, v17
	xtn2.16b	v5, v19
	mov.16b	v6, v5
	mov.16b	v7, v5
	fmul.4s	v17, v21, v2
	fadd.4s	v17, v17, v20
	ushll2.4s	v19, v24, #0
	ucvtf.4s	v19, v19
	ushll2.4s	v20, v25, #0
	ucvtf.4s	v20, v20
	st3.16b	{ v5, v6, v7 }, [x2], #48
	fmul.4s	v5, v19, v0
	fmul.4s	v6, v20, v1
	fadd.4s	v5, v6, v5
	ushll2.4s	v6, v18, #0
	ucvtf.4s	v6, v6
	fmul.4s	v6, v6, v2
	fadd.4s	v6, v6, v5
	fcvtnu.4s	v5, v17
	xtn.4h	v5, v5
	fcvtnu.4s	v6, v6
	xtn2.8h	v5, v6
	add	x8, x8, #16                     ; =16
	b	LBB0_1
LBB0_3:
	ucvtf.4s	v0, v3
	ushll.4s	v1, v4, #0
	ucvtf.4s	v1, v1
	mov	w8, #5767
	movk	w8, #16025, lsl #16
	dup.4s	v2, w8
	fmul.4s	v0, v0, v2
	mov	w8, #17826
	movk	w8, #16150, lsl #16
	dup.4s	v3, w8
	fmul.4s	v1, v1, v3
	fadd.4s	v0, v0, v1
	ushll.4s	v1, v19, #0
	mov	w8, #30933
	movk	w8, #15849, lsl #16
	dup.4s	v4, w8
	ucvtf.4s	v1, v1
	fmul.4s	v1, v1, v4
	fadd.4s	v0, v1, v0
	ucvtf.4s	v1, v18
	ucvtf.4s	v17, v17
	fmul.4s	v1, v1, v2
	fmul.4s	v2, v17, v3
	fadd.4s	v1, v1, v2
	ucvtf.4s	v2, v16
	fmul.4s	v2, v2, v4
	fadd.4s	v1, v2, v1
	fcvtnu.4s	v0, v0
	xtn.4h	v0, v0
	fcvtnu.4s	v1, v1
	xtn2.8h	v0, v1
	xtn2.16b	v5, v0
	mov.16b	v6, v5
	mov.16b	v7, v5
	st3.16b	{ v5, v6, v7 }, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
