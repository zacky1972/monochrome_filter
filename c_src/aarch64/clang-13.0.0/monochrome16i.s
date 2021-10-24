	.text
	.file	"monochrome16i.c"
	.globl	monochrome16i                   // -- Begin function monochrome16i
	.p2align	2
	.type	monochrome16i,@function
monochrome16i:                          // @monochrome16i
	.cfi_startproc
// %bb.0:
	cbz	x0, .LBB0_7
// %bb.1:
	cmp	x0, #8                          // =8
	b.lo	.LBB0_4
// %bb.2:
	add	x8, x0, x0, lsl #1
	add	x9, x1, x8
	cmp	x9, x2
	b.ls	.LBB0_8
// %bb.3:
	add	x8, x2, x8
	cmp	x8, x1
	b.ls	.LBB0_8
.LBB0_4:
	mov	x8, xzr
.LBB0_5:
	mov	w9, #8192
	mov	w10, #16384
	mov	w11, #32768
	sub	x8, x0, x8
	movk	w9, #16025, lsl #16
	movk	w10, #16150, lsl #16
	movk	w11, #15849, lsl #16
.LBB0_6:                                // =>This Inner Loop Header: Depth=1
	ldr	b0, [x1]
	ldr	b2, [x1, #1]
	ldr	b3, [x1, #2]
	fmov	s1, w9
	ucvtf	s0, s0
	fmul	s0, s0, s1
	fmov	s1, w10
	ucvtf	s2, s2
	fmul	s1, s2, s1
	fmov	s2, w11
	ucvtf	s3, s3
	fmul	s2, s3, s2
	fadd	s0, s0, s1
	fadd	s0, s0, s2
	fcvtzs	w12, s0
	subs	x8, x8, #1                      // =1
	add	x1, x1, #3                      // =3
	strb	w12, [x2]
	strb	w12, [x2, #1]
	strb	w12, [x2, #2]
	add	x2, x2, #3                      // =3
	b.ne	.LBB0_6
.LBB0_7:
	ret
.LBB0_8:
	cmp	x0, #16                         // =16
	b.hs	.LBB0_10
// %bb.9:
	mov	x8, xzr
	b	.LBB0_15
.LBB0_10:
	mov	w9, #8192
	mov	w10, #16384
	mov	w11, #32768
	and	x8, x0, #0xfffffffffffffff0
	movk	w9, #16025, lsl #16
	movk	w10, #16150, lsl #16
	movk	w11, #15849, lsl #16
	dup	v0.4s, w9
	dup	v1.4s, w10
	dup	v2.4s, w11
	mov	x9, x8
	mov	x10, x1
	mov	x11, x2
.LBB0_11:                               // =>This Inner Loop Header: Depth=1
	ld3	{ v3.16b, v4.16b, v5.16b }, [x10], #48
	subs	x9, x9, #16                     // =16
	zip1	v7.8b, v3.8b, v0.8b
	zip1	v17.8b, v4.8b, v0.8b
	zip2	v6.8b, v3.8b, v0.8b
	ext	v16.16b, v3.16b, v3.16b, #8
	zip1	v3.8b, v5.8b, v0.8b
	bic	v7.4h, #255, lsl #8
	bic	v17.4h, #255, lsl #8
	ushll	v7.4s, v7.4h, #0
	ushll	v17.4s, v17.4h, #0
	bic	v3.4h, #255, lsl #8
	ext	v19.16b, v4.16b, v4.16b, #8
	ucvtf	v7.4s, v7.4s
	ucvtf	v17.4s, v17.4s
	ushll	v3.4s, v3.4h, #0
	zip2	v18.8b, v4.8b, v0.8b
	ext	v20.16b, v5.16b, v5.16b, #8
	zip2	v21.8b, v5.8b, v0.8b
	zip1	v4.8b, v16.8b, v0.8b
	zip2	v5.8b, v16.8b, v0.8b
	zip1	v16.8b, v19.8b, v0.8b
	zip2	v19.8b, v19.8b, v0.8b
	fmul	v7.4s, v7.4s, v0.4s
	fmul	v17.4s, v17.4s, v1.4s
	ucvtf	v3.4s, v3.4s
	bic	v6.4h, #255, lsl #8
	bic	v18.4h, #255, lsl #8
	fadd	v7.4s, v7.4s, v17.4s
	zip2	v17.8b, v20.8b, v0.8b
	zip1	v20.8b, v20.8b, v0.8b
	bic	v4.4h, #255, lsl #8
	bic	v5.4h, #255, lsl #8
	bic	v16.4h, #255, lsl #8
	bic	v19.4h, #255, lsl #8
	fmul	v3.4s, v3.4s, v2.4s
	bic	v21.4h, #255, lsl #8
	ushll	v6.4s, v6.4h, #0
	ushll	v18.4s, v18.4h, #0
	bic	v17.4h, #255, lsl #8
	bic	v20.4h, #255, lsl #8
	ushll	v4.4s, v4.4h, #0
	ushll	v5.4s, v5.4h, #0
	ushll	v16.4s, v16.4h, #0
	ushll	v19.4s, v19.4h, #0
	fadd	v3.4s, v7.4s, v3.4s
	ushll	v21.4s, v21.4h, #0
	ucvtf	v6.4s, v6.4s
	ucvtf	v18.4s, v18.4s
	ushll	v17.4s, v17.4h, #0
	ushll	v20.4s, v20.4h, #0
	ucvtf	v4.4s, v4.4s
	ucvtf	v5.4s, v5.4s
	ucvtf	v16.4s, v16.4s
	ucvtf	v19.4s, v19.4s
	fcvtzs	v3.4s, v3.4s
	ucvtf	v21.4s, v21.4s
	fmul	v6.4s, v6.4s, v0.4s
	fmul	v18.4s, v18.4s, v1.4s
	ucvtf	v17.4s, v17.4s
	ucvtf	v20.4s, v20.4s
	fmul	v5.4s, v5.4s, v0.4s
	fmul	v4.4s, v4.4s, v0.4s
	fmul	v19.4s, v19.4s, v1.4s
	fmul	v16.4s, v16.4s, v1.4s
	xtn	v3.4h, v3.4s
	fmul	v21.4s, v21.4s, v2.4s
	fadd	v6.4s, v6.4s, v18.4s
	fmul	v18.4s, v20.4s, v2.4s
	fmul	v17.4s, v17.4s, v2.4s
	fadd	v4.4s, v4.4s, v16.4s
	fadd	v5.4s, v5.4s, v19.4s
	umov	w12, v3.h[0]
	fadd	v6.4s, v6.4s, v21.4s
	fadd	v5.4s, v5.4s, v17.4s
	fadd	v4.4s, v4.4s, v18.4s
	umov	w13, v3.h[1]
	fmov	s16, w12
	fcvtzs	v6.4s, v6.4s
	umov	w12, v3.h[2]
	mov	v16.b[1], w13
	xtn	v6.4h, v6.4s
	umov	w13, v3.h[3]
	mov	v16.b[2], w12
	umov	w12, v6.h[0]
	mov	v16.b[3], w13
	umov	w13, v6.h[1]
	mov	v16.b[4], w12
	fcvtzs	v4.4s, v4.4s
	umov	w12, v6.h[2]
	mov	v16.b[5], w13
	umov	w13, v6.h[3]
	xtn	v3.4h, v4.4s
	mov	v16.b[6], w12
	umov	w12, v3.h[0]
	mov	v16.b[7], w13
	umov	w13, v3.h[1]
	mov	v16.b[8], w12
	fcvtzs	v5.4s, v5.4s
	umov	w12, v3.h[2]
	mov	v16.b[9], w13
	xtn	v4.4h, v5.4s
	umov	w13, v3.h[3]
	mov	v16.b[10], w12
	umov	w12, v4.h[0]
	mov	v16.b[11], w13
	umov	w13, v4.h[1]
	mov	v16.b[12], w12
	umov	w12, v4.h[2]
	mov	v16.b[13], w13
	umov	w13, v4.h[3]
	mov	v16.b[14], w12
	mov	v16.b[15], w13
	mov	v17.16b, v16.16b
	mov	v18.16b, v16.16b
	st3	{ v16.16b, v17.16b, v18.16b }, [x11], #48
	b.ne	.LBB0_11
// %bb.12:
	cmp	x8, x0
	b.eq	.LBB0_7
// %bb.13:
	tbnz	w0, #3, .LBB0_15
// %bb.14:
	add	x9, x8, x8, lsl #1
	add	x2, x2, x9
	add	x1, x1, x9
	b	.LBB0_5
.LBB0_15:
	mov	x11, x8
	and	x8, x0, #0xfffffffffffffff8
	mov	w12, #8192
	mov	w13, #16384
	mov	w14, #32768
	add	x10, x11, x11, lsl #1
	movk	w12, #16025, lsl #16
	movk	w13, #16150, lsl #16
	movk	w14, #15849, lsl #16
	add	x15, x8, x8, lsl #1
	add	x9, x2, x10
	add	x10, x1, x10
	sub	x11, x11, x8
	dup	v0.4s, w12
	dup	v1.4s, w13
	add	x1, x1, x15
	add	x2, x2, x15
	dup	v2.4s, w14
.LBB0_16:                               // =>This Inner Loop Header: Depth=1
	ld3	{ v3.8b, v4.8b, v5.8b }, [x10], #24
	adds	x11, x11, #8                    // =8
	zip2	v6.8b, v3.8b, v0.8b
	zip1	v7.8b, v3.8b, v0.8b
	zip2	v16.8b, v4.8b, v0.8b
	zip1	v17.8b, v4.8b, v0.8b
	zip1	v18.8b, v5.8b, v0.8b
	zip2	v3.8b, v5.8b, v0.8b
	bic	v6.4h, #255, lsl #8
	bic	v7.4h, #255, lsl #8
	bic	v16.4h, #255, lsl #8
	bic	v17.4h, #255, lsl #8
	bic	v18.4h, #255, lsl #8
	bic	v3.4h, #255, lsl #8
	ushll	v4.4s, v6.4h, #0
	ushll	v5.4s, v7.4h, #0
	ushll	v6.4s, v16.4h, #0
	ushll	v7.4s, v17.4h, #0
	ushll	v16.4s, v18.4h, #0
	ushll	v3.4s, v3.4h, #0
	ucvtf	v4.4s, v4.4s
	ucvtf	v5.4s, v5.4s
	ucvtf	v6.4s, v6.4s
	ucvtf	v7.4s, v7.4s
	ucvtf	v16.4s, v16.4s
	ucvtf	v3.4s, v3.4s
	fmul	v5.4s, v5.4s, v0.4s
	fmul	v4.4s, v4.4s, v0.4s
	fmul	v7.4s, v7.4s, v1.4s
	fmul	v6.4s, v6.4s, v1.4s
	fmul	v3.4s, v3.4s, v2.4s
	fmul	v16.4s, v16.4s, v2.4s
	fadd	v4.4s, v4.4s, v6.4s
	fadd	v5.4s, v5.4s, v7.4s
	fadd	v5.4s, v5.4s, v16.4s
	fadd	v3.4s, v4.4s, v3.4s
	fcvtzs	v3.4s, v3.4s
	fcvtzs	v4.4s, v5.4s
	xtn	v3.4h, v3.4s
	xtn	v4.4h, v4.4s
	uzp1	v3.8b, v4.8b, v3.8b
	mov	v4.16b, v3.16b
	mov	v5.16b, v3.16b
	st3	{ v3.8b, v4.8b, v5.8b }, [x9], #24
	b.ne	.LBB0_16
// %bb.17:
	cmp	x8, x0
	b.ne	.LBB0_5
	b	.LBB0_7
.Lfunc_end0:
	.size	monochrome16i, .Lfunc_end0-monochrome16i
	.cfi_endproc
                                        // -- End function
	.ident	"clang version 13.0.0 (http://git.linaro.org/toolchain/jenkins-scripts.git d04b0fafc2d906fd9b2e8e55efb35c9cf7114e68)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
