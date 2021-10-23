	.arch armv8-a
	.file	"monochrome16i.c"
	.text
	.align	2
	.p2align 3,,7
	.global	monochrome16i
	.type	monochrome16i, %function
monochrome16i:
	stp	x29, x30, [sp, -32]!
	adrp	x6, :got:__stack_chk_guard
	add	x29, sp, 0
	ldr	x3, [x6, #:got_lo12:__stack_chk_guard]
	ldr	x4, [x3]
	str	x4, [x29, 24]
	mov	x4,0
	cbz	x0, .L1
	add	x4, x2, 48
	add	x3, x1, 48
	cmp	x1, x4
	ccmp	x2, x3, 2, cc
	ccmp	x0, 15, 0, cs
	bls	.L3
	adrp	x5, .LC0
	adrp	x4, .LC1
	adrp	x3, .LC2
	lsr	x7, x0, 4
	ldr	q6, [x5, #:lo12:.LC0]
	mov	x5, x1
	ldr	q5, [x4, #:lo12:.LC1]
	mov	x4, x2
	ldr	q4, [x3, #:lo12:.LC2]
	mov	x3, 0
	.p2align 3
.L4:
	ld3	{v22.16b - v24.16b}, [x5], 48
	add	x3, x3, 1
	cmp	x7, x3
	ushll	v2.8h, v23.8b, 0
	ushll	v1.8h, v22.8b, 0
	ushll2	v0.8h, v22.16b, 0
	ushll2	v20.8h, v23.16b, 0
	ushll	v19.8h, v24.8b, 0
	ushll2	v7.8h, v24.16b, 0
	ushll	v3.4s, v1.4h, 0
	ushll	v25.4s, v2.4h, 0
	ushll2	v21.4s, v2.8h, 0
	ushll	v24.4s, v20.4h, 0
	ushll	v2.4s, v0.4h, 0
	ushll2	v1.4s, v1.8h, 0
	ushll2	v0.4s, v0.8h, 0
	ushll2	v20.4s, v20.8h, 0
	ushll	v23.4s, v19.4h, 0
	ushll	v22.4s, v7.4h, 0
	scvtf	v3.4s, v3.4s
	scvtf	v25.4s, v25.4s
	scvtf	v1.4s, v1.4s
	scvtf	v21.4s, v21.4s
	ushll2	v19.4s, v19.8h, 0
	scvtf	v2.4s, v2.4s
	scvtf	v24.4s, v24.4s
	scvtf	v0.4s, v0.4s
	scvtf	v20.4s, v20.4s
	ushll2	v7.4s, v7.8h, 0
	fmul	v21.4s, v21.4s, v5.4s
	fmul	v3.4s, v3.4s, v6.4s
	fmul	v25.4s, v25.4s, v5.4s
	scvtf	v23.4s, v23.4s
	fmul	v1.4s, v1.4s, v6.4s
	scvtf	v19.4s, v19.4s
	fmul	v2.4s, v2.4s, v6.4s
	fmul	v24.4s, v24.4s, v5.4s
	scvtf	v22.4s, v22.4s
	fmul	v0.4s, v0.4s, v6.4s
	fmul	v20.4s, v20.4s, v5.4s
	scvtf	v7.4s, v7.4s
	fadd	v1.4s, v1.4s, v21.4s
	fadd	v3.4s, v3.4s, v25.4s
	fmul	v23.4s, v23.4s, v4.4s
	fmul	v7.4s, v7.4s, v4.4s
	fmul	v19.4s, v19.4s, v4.4s
	fadd	v2.4s, v2.4s, v24.4s
	fmul	v21.4s, v22.4s, v4.4s
	fadd	v0.4s, v0.4s, v20.4s
	fadd	v3.4s, v3.4s, v23.4s
	fadd	v1.4s, v1.4s, v19.4s
	fadd	v2.4s, v2.4s, v21.4s
	fadd	v0.4s, v0.4s, v7.4s
	fcvtzs	v3.4s, v3.4s
	fcvtzs	v1.4s, v1.4s
	fcvtzs	v2.4s, v2.4s
	fcvtzs	v0.4s, v0.4s
	xtn	v7.4h, v3.4s
	xtn2	v7.8h, v1.4s
	xtn	v1.4h, v2.4s
	xtn2	v1.8h, v0.4s
	xtn	v0.8b, v7.8h
	xtn2	v0.16b, v1.8h
	mov	v16.16b, v0.16b
	mov	v17.16b, v0.16b
	mov	v18.16b, v0.16b
	st3	{v16.16b - v18.16b}, [x4], 48
	bhi	.L4
	and	x5, x0, -16
	cmp	x0, x5
	add	x9, x5, x5, lsl 1
	add	x4, x1, x9
	add	x3, x2, x9
	beq	.L1
	ldrb	w1, [x1, x9]
	mov	w11, 5767
	ldrb	w8, [x4, 1]
	mov	w10, 17826
	ldrb	w7, [x4, 2]
	movk	w10, 0x3f16, lsl 16
	scvtf	s0, w1
	fmov	s2, w10
	scvtf	s5, w8
	movk	w11, 0x3e99, lsl 16
	fmov	s3, w11
	scvtf	s4, w7
	mov	w10, 30933
	add	x1, x5, 1
	fmul	s0, s0, s3
	movk	w10, 0x3de9, lsl 16
	fmul	s5, s5, s2
	fmov	s1, w10
	cmp	x0, x1
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x2, x9]
	strb	w1, [x3, 1]
	strb	w1, [x3, 2]
	bls	.L1
	ldrb	w1, [x4, 3]
	add	x8, x5, 2
	ldrb	w7, [x4, 4]
	cmp	x0, x8
	ldrb	w2, [x4, 5]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 3]
	strb	w1, [x3, 4]
	strb	w1, [x3, 5]
	bls	.L1
	ldrb	w1, [x4, 6]
	add	x8, x5, 3
	ldrb	w7, [x4, 7]
	cmp	x0, x8
	ldrb	w2, [x4, 8]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 6]
	strb	w1, [x3, 7]
	strb	w1, [x3, 8]
	bls	.L1
	ldrb	w1, [x4, 9]
	add	x8, x5, 4
	ldrb	w7, [x4, 10]
	cmp	x0, x8
	ldrb	w2, [x4, 11]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 9]
	strb	w1, [x3, 10]
	strb	w1, [x3, 11]
	bls	.L1
	ldrb	w1, [x4, 12]
	add	x8, x5, 5
	ldrb	w7, [x4, 13]
	cmp	x0, x8
	ldrb	w2, [x4, 14]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 12]
	strb	w1, [x3, 13]
	strb	w1, [x3, 14]
	bls	.L1
	ldrb	w1, [x4, 15]
	add	x8, x5, 6
	ldrb	w7, [x4, 16]
	cmp	x0, x8
	ldrb	w2, [x4, 17]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 15]
	strb	w1, [x3, 16]
	strb	w1, [x3, 17]
	bls	.L1
	ldrb	w1, [x4, 18]
	add	x8, x5, 7
	ldrb	w7, [x4, 19]
	cmp	x0, x8
	ldrb	w2, [x4, 20]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 18]
	strb	w1, [x3, 19]
	strb	w1, [x3, 20]
	bls	.L1
	ldrb	w1, [x4, 21]
	add	x8, x5, 8
	ldrb	w7, [x4, 22]
	cmp	x0, x8
	ldrb	w2, [x4, 23]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s3, s0, s3
	fmul	s2, s5, s2
	fmul	s0, s4, s1
	fadd	s1, s3, s2
	fadd	s1, s1, s0
	fcvtzu	w1, s1
	and	w1, w1, 255
	strb	w1, [x3, 21]
	strb	w1, [x3, 22]
	strb	w1, [x3, 23]
	bls	.L1
	ldrb	w1, [x4, 24]
	mov	w8, 17826
	ldrb	w7, [x4, 25]
	movk	w8, 0x3f16, lsl 16
	ldrb	w2, [x4, 26]
	fmov	s3, w11
	scvtf	s0, w1
	fmov	s2, w8
	scvtf	s5, w7
	fmov	s1, w10
	scvtf	s4, w2
	add	x1, x5, 9
	cmp	x0, x1
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 24]
	strb	w1, [x3, 25]
	strb	w1, [x3, 26]
	bls	.L1
	ldrb	w1, [x4, 27]
	add	x8, x5, 10
	ldrb	w7, [x4, 28]
	cmp	x0, x8
	ldrb	w2, [x4, 29]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 27]
	strb	w1, [x3, 28]
	strb	w1, [x3, 29]
	bls	.L1
	ldrb	w1, [x4, 30]
	add	x8, x5, 11
	ldrb	w7, [x4, 31]
	cmp	x0, x8
	ldrb	w2, [x4, 32]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 30]
	strb	w1, [x3, 31]
	strb	w1, [x3, 32]
	bls	.L1
	ldrb	w1, [x4, 33]
	add	x8, x5, 12
	ldrb	w7, [x4, 34]
	cmp	x0, x8
	ldrb	w2, [x4, 35]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 33]
	strb	w1, [x3, 34]
	strb	w1, [x3, 35]
	bls	.L1
	ldrb	w1, [x4, 36]
	add	x8, x5, 13
	ldrb	w7, [x4, 37]
	cmp	x0, x8
	ldrb	w2, [x4, 38]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w1, s0
	and	w1, w1, 255
	strb	w1, [x3, 36]
	strb	w1, [x3, 37]
	strb	w1, [x3, 38]
	bls	.L1
	ldrb	w1, [x4, 39]
	add	x5, x5, 14
	ldrb	w7, [x4, 40]
	cmp	x0, x5
	ldrb	w2, [x4, 41]
	scvtf	s0, w1
	scvtf	s5, w7
	scvtf	s4, w2
	fmul	s0, s0, s3
	fmul	s5, s5, s2
	fmul	s4, s4, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fcvtzu	w0, s0
	and	w0, w0, 255
	strb	w0, [x3, 39]
	strb	w0, [x3, 40]
	strb	w0, [x3, 41]
	bls	.L1
	ldrb	w0, [x4, 42]
	ldrb	w2, [x4, 43]
	ldrb	w1, [x4, 44]
	scvtf	s0, w0
	scvtf	s5, w2
	scvtf	s4, w1
	fmul	s0, s0, s3
	fmul	s2, s5, s2
	fmul	s1, s4, s1
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	fcvtzu	w0, s0
	and	w0, w0, 255
	strb	w0, [x3, 42]
	strb	w0, [x3, 43]
	strb	w0, [x3, 44]
	.p2align 3
.L1:
	ldr	x6, [x6, #:got_lo12:__stack_chk_guard]
	ldr	x1, [x29, 24]
	ldr	x0, [x6]
	eor	x0, x1, x0
	cbnz	x0, .L16
	ldp	x29, x30, [sp], 32
	ret
	.p2align 2
.L3:
	add	x0, x0, x0, lsl 1
	mov	w5, 17826
	add	x3, x2, x0
	mov	w4, 5767
	mov	w0, 30933
	movk	w5, 0x3f16, lsl 16
	movk	w4, 0x3e99, lsl 16
	movk	w0, 0x3de9, lsl 16
	fmov	s5, w5
	fmov	s4, w4
	fmov	s3, w0
	.p2align 3
.L6:
	ldrb	w0, [x1, 1]
	add	x1, x1, 3
	ldrb	w5, [x1, -3]
	add	x2, x2, 3
	cmp	x3, x2
	scvtf	s0, w0
	scvtf	s2, w5
	ldrb	w4, [x1, -1]
	fmul	s0, s0, s5
	scvtf	s1, w4
	fmul	s2, s2, s4
	fmul	s1, s1, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	fcvtzu	w0, s0
	and	w0, w0, 255
	strb	w0, [x2, -3]
	strb	w0, [x2, -2]
	strb	w0, [x2, -1]
	bne	.L6
	b	.L1
.L16:
	bl	__stack_chk_fail
	.size	monochrome16i, .-monochrome16i
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
	.text
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
