	.arch armv8-a
	.file	"monochrome32.c"
	.text
	.align	2
	.p2align 4,,11
	.global	monochrome32
	.type	monochrome32, %function
monochrome32:
.LFB0:
	.cfi_startproc
	cbz	x0, .L1
	add	x4, x1, 3
	sub	x3, x0, #1
	sub	x5, x2, x4
	add	x5, x5, 2
	cmp	x5, 46
	ccmp	x3, 14, 0, hi
	bls	.L3
	adrp	x5, .LC0
	lsr	x4, x0, 4
	mov	x3, x1
	ldr	q7, [x5, #:lo12:.LC0]
	adrp	x5, .LC1
	add	x4, x4, x4, lsl 1
	ldr	q6, [x5, #:lo12:.LC1]
	adrp	x5, .LC2
	add	x4, x1, x4, lsl 4
	ldr	q5, [x5, #:lo12:.LC2]
	mov	x5, x2
	.p2align 3,,7
.L4:
	ld3	{v19.16b - v21.16b}, [x3], 48
	uxtl	v2.8h, v20.8b
	uxtl	v1.8h, v19.8b
	uxtl2	v0.8h, v19.16b
	uxtl2	v17.8h, v20.16b
	uxtl	v16.8h, v21.8b
	uxtl2	v4.8h, v21.16b
	uxtl	v3.4s, v1.4h
	uxtl	v22.4s, v2.4h
	uxtl2	v18.4s, v2.8h
	uxtl	v21.4s, v17.4h
	uxtl	v2.4s, v0.4h
	uxtl2	v1.4s, v1.8h
	uxtl2	v0.4s, v0.8h
	uxtl2	v17.4s, v17.8h
	uxtl	v20.4s, v16.4h
	uxtl	v19.4s, v4.4h
	scvtf	v3.4s, v3.4s
	scvtf	v1.4s, v1.4s
	scvtf	v22.4s, v22.4s
	scvtf	v18.4s, v18.4s
	uxtl2	v16.4s, v16.8h
	scvtf	v2.4s, v2.4s
	scvtf	v0.4s, v0.4s
	scvtf	v21.4s, v21.4s
	scvtf	v17.4s, v17.4s
	uxtl2	v4.4s, v4.8h
	fmul	v18.4s, v18.4s, v6.4s
	fmul	v3.4s, v3.4s, v7.4s
	fmul	v17.4s, v17.4s, v6.4s
	fmul	v1.4s, v1.4s, v7.4s
	fmul	v22.4s, v22.4s, v6.4s
	scvtf	v20.4s, v20.4s
	scvtf	v16.4s, v16.4s
	fmul	v2.4s, v2.4s, v7.4s
	fmul	v0.4s, v0.4s, v7.4s
	fmul	v21.4s, v21.4s, v6.4s
	scvtf	v19.4s, v19.4s
	scvtf	v4.4s, v4.4s
	fadd	v1.4s, v1.4s, v18.4s
	fadd	v0.4s, v0.4s, v17.4s
	fadd	v3.4s, v3.4s, v22.4s
	fmul	v4.4s, v4.4s, v5.4s
	fmul	v18.4s, v20.4s, v5.4s
	fmul	v16.4s, v16.4s, v5.4s
	fadd	v2.4s, v2.4s, v21.4s
	fmul	v17.4s, v19.4s, v5.4s
	fadd	v0.4s, v0.4s, v4.4s
	fadd	v3.4s, v3.4s, v18.4s
	fadd	v1.4s, v1.4s, v16.4s
	fadd	v2.4s, v2.4s, v17.4s
	fcvtzs	v0.4s, v0.4s
	fcvtzs	v3.4s, v3.4s
	fcvtzs	v1.4s, v1.4s
	fcvtzs	v2.4s, v2.4s
	xtn	v4.4h, v3.4s
	xtn2	v4.8h, v1.4s
	xtn	v1.4h, v2.4s
	xtn2	v1.8h, v0.4s
	xtn	v0.8b, v4.8h
	xtn2	v0.16b, v1.8h
	mov	v1.16b, v0.16b
	mov	v2.16b, v0.16b
	mov	v3.16b, v0.16b
	st3	{v1.16b - v3.16b}, [x5], 48
	cmp	x3, x4
	bne	.L4
	and	x5, x0, -16
	add	x6, x5, x5, lsl 1
	add	x4, x1, x6
	add	x3, x2, x6
	cmp	x0, x5
	beq	.L1
	ldr	b0, [x1, x6]
	mov	w1, 5767
	ldr	b5, [x4, 1]
	movk	w1, 0x3e99, lsl 16
	ldr	b4, [x4, 2]
	fmov	s2, w1
	scvtf	s0, s0
	mov	w1, 17826
	scvtf	s5, s5
	movk	w1, 0x3f16, lsl 16
	fmov	s1, w1
	scvtf	s4, s4
	mov	w1, 30933
	add	x7, x5, 1
	fmul	s0, s0, s2
	movk	w1, 0x3de9, lsl 16
	fmul	s5, s5, s1
	fmov	s3, w1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x2, x6]
	strb	w1, [x3, 1]
	strb	w1, [x3, 2]
	cmp	x0, x7
	bls	.L1
	ldr	b0, [x4, 3]
	add	x2, x5, 2
	ldr	b5, [x4, 4]
	ldr	b4, [x4, 5]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 3]
	strb	w1, [x3, 4]
	strb	w1, [x3, 5]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 6]
	add	x2, x5, 3
	ldr	b5, [x4, 7]
	ldr	b4, [x4, 8]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 6]
	strb	w1, [x3, 7]
	strb	w1, [x3, 8]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 9]
	add	x2, x5, 4
	ldr	b5, [x4, 10]
	ldr	b4, [x4, 11]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 9]
	strb	w1, [x3, 10]
	strb	w1, [x3, 11]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 12]
	add	x2, x5, 5
	ldr	b5, [x4, 13]
	ldr	b4, [x4, 14]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 12]
	strb	w1, [x3, 13]
	strb	w1, [x3, 14]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 15]
	add	x2, x5, 6
	ldr	b5, [x4, 16]
	ldr	b4, [x4, 17]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 15]
	strb	w1, [x3, 16]
	strb	w1, [x3, 17]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 18]
	add	x2, x5, 7
	ldr	b5, [x4, 19]
	ldr	b4, [x4, 20]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 18]
	strb	w1, [x3, 19]
	strb	w1, [x3, 20]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 21]
	add	x2, x5, 8
	ldr	b5, [x4, 22]
	ldr	b4, [x4, 23]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s2, s5, s1
	fmul	s1, s4, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 21]
	strb	w1, [x3, 22]
	strb	w1, [x3, 23]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 24]
	mov	w1, 5767
	ldr	b5, [x4, 25]
	movk	w1, 0x3e99, lsl 16
	ldr	b4, [x4, 26]
	fmov	s2, w1
	scvtf	s0, s0
	mov	w1, 17826
	scvtf	s5, s5
	movk	w1, 0x3f16, lsl 16
	fmov	s1, w1
	scvtf	s4, s4
	mov	w1, 30933
	add	x2, x5, 9
	fmul	s0, s0, s2
	movk	w1, 0x3de9, lsl 16
	fmul	s5, s5, s1
	fmov	s3, w1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 24]
	strb	w1, [x3, 25]
	strb	w1, [x3, 26]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 27]
	add	x2, x5, 10
	ldr	b5, [x4, 28]
	ldr	b4, [x4, 29]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 27]
	strb	w1, [x3, 28]
	strb	w1, [x3, 29]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 30]
	add	x2, x5, 11
	ldr	b5, [x4, 31]
	ldr	b4, [x4, 32]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 30]
	strb	w1, [x3, 31]
	strb	w1, [x3, 32]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 33]
	add	x2, x5, 12
	ldr	b5, [x4, 34]
	ldr	b4, [x4, 35]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 33]
	strb	w1, [x3, 34]
	strb	w1, [x3, 35]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 36]
	add	x2, x5, 13
	ldr	b5, [x4, 37]
	ldr	b4, [x4, 38]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 36]
	strb	w1, [x3, 37]
	strb	w1, [x3, 38]
	cmp	x0, x2
	bls	.L1
	ldr	b0, [x4, 39]
	add	x5, x5, 14
	ldr	b5, [x4, 40]
	ldr	b4, [x4, 41]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s5, s5, s1
	fmul	s4, s4, s3
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 39]
	strb	w1, [x3, 40]
	strb	w1, [x3, 41]
	cmp	x0, x5
	bls	.L1
	ldr	b0, [x4, 42]
	ldr	b5, [x4, 43]
	ldr	b4, [x4, 44]
	scvtf	s0, s0
	scvtf	s5, s5
	scvtf	s4, s4
	fmul	s0, s0, s2
	fmul	s2, s5, s1
	fmul	s1, s4, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	fcvtzu	w0, s0
	and	w0, w0, 255
	strb	w0, [x3, 42]
	strb	w0, [x3, 43]
	strb	w0, [x3, 44]
.L1:
	ret
	.p2align 2,,3
.L3:
	mov	w3, 17826
	add	x0, x0, x0, lsl 1
	movk	w3, 0x3f16, lsl 16
	mov	w5, 5767
	fmov	s5, w3
	add	x0, x2, x0
	mov	w3, 30933
	movk	w5, 0x3e99, lsl 16
	movk	w3, 0x3de9, lsl 16
	fmov	s4, w5
	fmov	s3, w3
	.p2align 3,,7
.L6:
	ldr	b2, [x1]
	add	x2, x2, 3
	ldr	b0, [x1, 1]
	mov	x1, x4
	ldr	b1, [x4, -1]
	add	x4, x4, 3
	scvtf	s2, s2
	scvtf	s0, s0
	scvtf	s1, s1
	fmul	s2, s2, s4
	fmul	s0, s0, s5
	fmul	s1, s1, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	fcvtzu	w3, s0
	and	w3, w3, 255
	strb	w3, [x2, -3]
	strb	w3, [x2, -2]
	strb	w3, [x2, -1]
	cmp	x2, x0
	bne	.L6
	ret
	.cfi_endproc
.LFE0:
	.size	monochrome32, .-monochrome32
	.section	.rodata.cst16,"aM",@progbits,16
	.align	4
.LC0:
	.word	1050220167
	.word	1050220167
	.word	1050220167
	.word	1050220167
	.align	4
.LC1:
	.word	1058424226
	.word	1058424226
	.word	1058424226
	.word	1058424226
	.align	4
.LC2:
	.word	1038710997
	.word	1038710997
	.word	1038710997
	.word	1038710997
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
