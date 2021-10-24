	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0
	.globl	_monochrome32                   ; -- Begin function monochrome32
	.p2align	2
_monochrome32:                          ; @monochrome32
	.cfi_startproc
; %bb.0:                                ; %entry
	cbz	x0, LBB0_8
; %bb.1:                                ; %iter.check
	cmp	x0, #8                          ; =8
	b.lo	LBB0_5
; %bb.2:                                ; %vector.memcheck
	add	x8, x0, x0, lsl #1
	add	x9, x2, x8
	add	x8, x1, x8
	cmp	x8, x2
	ccmp	x9, x1, #0, hi
	b.hi	LBB0_5
; %bb.3:                                ; %vector.main.loop.iter.check
	cmp	x0, #16                         ; =16
	b.hs	LBB0_9
; %bb.4:
	mov	x8, #0
	b	LBB0_14
LBB0_5:
	mov	x8, #0
	mov	x9, x1
	mov	x10, x2
LBB0_6:                                 ; %for.body.preheader
	sub	x8, x0, x8
	mov	w11, #5767
	movk	w11, #16025, lsl #16
	mov	w12, #17826
	movk	w12, #16150, lsl #16
	mov	w13, #30933
	movk	w13, #15849, lsl #16
LBB0_7:                                 ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	ldr	b0, [x9]
	ucvtf	s0, s0
	fmov	s1, w11
	fmul	s0, s0, s1
	ldr	b1, [x9, #1]
	ucvtf	s1, s1
	fmov	s2, w12
	fmul	s1, s1, s2
	fadd	s0, s0, s1
	ldr	b1, [x9, #2]
	ucvtf	s1, s1
	fmov	s2, w13
	fmul	s1, s1, s2
	fadd	s0, s0, s1
	fcvtzs	w14, s0
	strb	w14, [x10]
	strb	w14, [x10, #1]
	strb	w14, [x10, #2]
	add	x9, x9, #3                      ; =3
	add	x10, x10, #3                    ; =3
	subs	x8, x8, #1                      ; =1
	b.ne	LBB0_7
LBB0_8:                                 ; %for.cond.cleanup
	ret
LBB0_9:                                 ; %vector.ph
	and	x8, x0, #0xfffffffffffffff0
	mov	w9, #5767
	movk	w9, #16025, lsl #16
	dup.4s	v0, w9
	mov	w9, #17826
	movk	w9, #16150, lsl #16
	dup.4s	v1, w9
	mov	w9, #30933
	movk	w9, #15849, lsl #16
	dup.4s	v2, w9
	mov	x9, x8
	mov	x10, x1
	mov	x11, x2
LBB0_10:                                ; %vector.body
                                        ; =>This Inner Loop Header: Depth=1
	ld3.16b	{ v4, v5, v6 }, [x10], #48
	zip1.8b	v3, v4, v0
	bic.4h	v3, #255, lsl #8
	ushll.4s	v3, v3, #0
	ucvtf.4s	v7, v3
	zip2.8b	v3, v4, v0
	bic.4h	v3, #255, lsl #8
	ushll.4s	v3, v3, #0
	ucvtf.4s	v16, v3
	ext.16b	v3, v4, v4, #8
	zip1.8b	v17, v3, v0
	bic.4h	v17, #255, lsl #8
	ushll.4s	v17, v17, #0
	zip2.8b	v18, v3, v0
	ucvtf.4s	v3, v17
	bic.4h	v18, #255, lsl #8
	ushll.4s	v17, v18, #0
	zip1.8b	v18, v5, v0
	bic.4h	v18, #255, lsl #8
	ushll.4s	v18, v18, #0
	ucvtf.4s	v17, v17
	ucvtf.4s	v18, v18
	zip2.8b	v19, v5, v0
	bic.4h	v19, #255, lsl #8
	ushll.4s	v19, v19, #0
	ucvtf.4s	v19, v19
	fmul.4s	v16, v16, v0
	ext.16b	v20, v5, v5, #8
	ext.16b	v21, v6, v6, #8
	zip2.8b	v22, v6, v0
	zip1.8b	v4, v6, v0
	zip1.8b	v5, v20, v0
	fmul.4s	v6, v7, v0
	bic.4h	v5, #255, lsl #8
	ushll.4s	v5, v5, #0
	zip2.8b	v7, v20, v0
	bic.4h	v7, #255, lsl #8
	ushll.4s	v7, v7, #0
	ucvtf.4s	v5, v5
	ucvtf.4s	v7, v7
	fmul.4s	v19, v19, v1
	fmul.4s	v18, v18, v1
	zip2.8b	v20, v21, v0
	bic.4h	v20, #255, lsl #8
	fmul.4s	v17, v17, v0
	ushll.4s	v20, v20, #0
	ucvtf.4s	v20, v20
	zip1.8b	v21, v21, v0
	bic.4h	v22, #255, lsl #8
	ushll.4s	v22, v22, #0
	fadd.4s	v6, v6, v18
	ucvtf.4s	v18, v22
	bic.4h	v4, #255, lsl #8
	ushll.4s	v4, v4, #0
	ucvtf.4s	v4, v4
	fmul.4s	v4, v4, v2
	fadd.4s	v16, v16, v19
	fmul.4s	v18, v18, v2
	fadd.4s	v4, v6, v4
	fcvtzs.4s	v4, v4
	xtn.4h	v4, v4
	umov.h	w12, v4[1]
	umov.h	w13, v4[0]
	fmov	s22, w13
	mov.b	v22[1], w12
	fadd.4s	v6, v16, v18
	bic.4h	v21, #255, lsl #8
	umov.h	w12, v4[2]
	mov.b	v22[2], w12
	fmul.4s	v3, v3, v0
	ushll.4s	v16, v21, #0
	umov.h	w12, v4[3]
	fcvtzs.4s	v4, v6
	mov.b	v22[3], w12
	xtn.4h	v4, v4
	umov.h	w12, v4[0]
	mov.b	v22[4], w12
	fmul.4s	v5, v5, v1
	ucvtf.4s	v6, v16
	umov.h	w12, v4[1]
	mov.b	v22[5], w12
	fadd.4s	v3, v3, v5
	fmul.4s	v5, v6, v2
	umov.h	w12, v4[2]
	mov.b	v22[6], w12
	fmul.4s	v6, v7, v1
	fadd.4s	v3, v3, v5
	umov.h	w12, v4[3]
	fcvtzs.4s	v3, v3
	mov.b	v22[7], w12
	xtn.4h	v3, v3
	umov.h	w12, v3[0]
	mov.b	v22[8], w12
	fadd.4s	v4, v17, v6
	fmul.4s	v5, v20, v2
	umov.h	w12, v3[1]
	mov.b	v22[9], w12
	fadd.4s	v4, v4, v5
	umov.h	w12, v3[2]
	mov.b	v22[10], w12
	umov.h	w12, v3[3]
	mov.b	v22[11], w12
	fcvtzs.4s	v3, v4
	xtn.4h	v3, v3
	umov.h	w12, v3[0]
	mov.b	v22[12], w12
	umov.h	w12, v3[1]
	mov.b	v22[13], w12
	umov.h	w12, v3[2]
	mov.b	v22[14], w12
	umov.h	w12, v3[3]
	mov.b	v22[15], w12
	mov.16b	v23, v22
	mov.16b	v24, v22
	st3.16b	{ v22, v23, v24 }, [x11], #48
	subs	x9, x9, #16                     ; =16
	b.ne	LBB0_10
; %bb.11:                               ; %middle.block
	cmp	x8, x0
	b.eq	LBB0_8
; %bb.12:                               ; %vec.epilog.iter.check
	tbnz	w0, #3, LBB0_14
; %bb.13:
	add	x9, x8, x8, lsl #1
	add	x10, x2, x9
	add	x9, x1, x9
	b	LBB0_6
LBB0_14:                                ; %vec.epilog.ph
	mov	x13, x8
	and	x8, x0, #0xfffffffffffffff8
	add	x10, x8, x8, lsl #1
	add	x9, x1, x10
	add	x10, x2, x10
	add	x12, x13, x13, lsl #1
	add	x11, x2, x12
	add	x12, x1, x12
	sub	x13, x13, x8
	mov	w14, #5767
	movk	w14, #16025, lsl #16
	dup.4s	v0, w14
	mov	w14, #17826
	movk	w14, #16150, lsl #16
	dup.4s	v1, w14
	mov	w14, #30933
	movk	w14, #15849, lsl #16
	dup.4s	v2, w14
LBB0_15:                                ; %vec.epilog.vector.body
                                        ; =>This Inner Loop Header: Depth=1
	ld3.8b	{ v3, v4, v5 }, [x12], #24
	zip2.8b	v6, v3, v0
	bic.4h	v6, #255, lsl #8
	ushll.4s	v6, v6, #0
	ucvtf.4s	v6, v6
	zip1.8b	v7, v3, v0
	bic.4h	v7, #255, lsl #8
	ushll.4s	v7, v7, #0
	ucvtf.4s	v7, v7
	fmul.4s	v7, v7, v0
	fmul.4s	v6, v6, v0
	zip2.8b	v16, v4, v0
	bic.4h	v16, #255, lsl #8
	ushll.4s	v16, v16, #0
	ucvtf.4s	v16, v16
	zip1.8b	v17, v4, v0
	bic.4h	v17, #255, lsl #8
	ushll.4s	v17, v17, #0
	ucvtf.4s	v17, v17
	fmul.4s	v17, v17, v1
	fmul.4s	v16, v16, v1
	fadd.4s	v6, v6, v16
	fadd.4s	v7, v7, v17
	zip1.8b	v16, v5, v0
	bic.4h	v16, #255, lsl #8
	ushll.4s	v16, v16, #0
	ucvtf.4s	v16, v16
	zip2.8b	v3, v5, v0
	bic.4h	v3, #255, lsl #8
	ushll.4s	v3, v3, #0
	ucvtf.4s	v3, v3
	fmul.4s	v3, v3, v2
	fmul.4s	v4, v16, v2
	fadd.4s	v4, v7, v4
	fadd.4s	v3, v6, v3
	fcvtzs.4s	v3, v3
	xtn.4h	v3, v3
	fcvtzs.4s	v4, v4
	xtn.4h	v4, v4
	uzp1.8b	v3, v4, v3
	mov.16b	v4, v3
	mov.16b	v5, v3
	st3.8b	{ v3, v4, v5 }, [x11], #24
	adds	x13, x13, #8                    ; =8
	b.ne	LBB0_15
; %bb.16:                               ; %vec.epilog.middle.block
	cmp	x8, x0
	b.ne	LBB0_6
	b	LBB0_8
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
