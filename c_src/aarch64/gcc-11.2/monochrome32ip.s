	.arch armv8-a
	.file	"monochrome32ip.c"
	.text
	.align	2
	.p2align 4,,11
	.global	monochrome32ip
	.type	monochrome32ip, %function
monochrome32ip:
.LFB4340:
	.cfi_startproc
	ld3	{v16.16b - v18.16b}, [x1], 48
	adrp	x4, .LANCHOR0
	add	x3, x4, :lo12:.LANCHOR0
	ldr	q7, [x4, #:lo12:.LANCHOR0]
	uxtl	v0.8h, v16.8b
	uxtl	v4.8h, v17.8b
	uxtl	v3.8h, v18.8b
	ldp	q5, q6, [x3, 16]
	uxtl	v2.4s, v0.4h
	uxtl2	v1.4s, v0.8h
	uxtl	v20.4s, v4.4h
	uxtl2	v0.4s, v4.8h
	uxtl	v19.4s, v3.4h
	uxtl2	v4.4s, v3.8h
	ucvtf	v20.4s, v20.4s
	ucvtf	v2.4s, v2.4s
	ucvtf	v1.4s, v1.4s
	ucvtf	v0.4s, v0.4s
	fmul	v3.4s, v5.4s, v20.4s
	fmul	v2.4s, v7.4s, v2.4s
	fmul	v1.4s, v7.4s, v1.4s
	fmul	v0.4s, v5.4s, v0.4s
	ucvtf	v19.4s, v19.4s
	ucvtf	v4.4s, v4.4s
	fadd	v2.4s, v2.4s, v3.4s
	fadd	v1.4s, v1.4s, v0.4s
	fmul	v19.4s, v6.4s, v19.4s
	fmul	v4.4s, v6.4s, v4.4s
	uxtl2	v3.8h, v16.16b
	uxtl2	v0.8h, v17.16b
	fadd	v2.4s, v2.4s, v19.4s
	fadd	v1.4s, v1.4s, v4.4s
	uxtl2	v20.8h, v18.16b
	fcvtnu	v2.4s, v2.4s
	fcvtnu	v1.4s, v1.4s
	xtn	v23.4h, v2.4s
	xtn2	v23.8h, v1.4s
	cmp	x0, 16
	bls	.L2
	mov	x3, 16
	.p2align 3,,7
.L3:
	uxtl	v19.4s, v3.4h
	add	x3, x3, 16
	uxtl2	v2.4s, v3.8h
	uxtl	v4.4s, v0.4h
	uxtl2	v3.4s, v0.8h
	uxtl	v1.4s, v20.4h
	uxtl2	v0.4s, v20.8h
	ucvtf	v19.4s, v19.4s
	ucvtf	v2.4s, v2.4s
	ucvtf	v4.4s, v4.4s
	ucvtf	v3.4s, v3.4s
	fmul	v19.4s, v7.4s, v19.4s
	fmul	v2.4s, v7.4s, v2.4s
	fmul	v4.4s, v5.4s, v4.4s
	fmul	v3.4s, v5.4s, v3.4s
	ucvtf	v1.4s, v1.4s
	ucvtf	v0.4s, v0.4s
	fadd	v4.4s, v4.4s, v19.4s
	fadd	v3.4s, v3.4s, v2.4s
	fmul	v1.4s, v6.4s, v1.4s
	fmul	v0.4s, v6.4s, v0.4s
	ld3	{v19.16b - v21.16b}, [x1], 48
	fadd	v4.4s, v4.4s, v1.4s
	fadd	v3.4s, v3.4s, v0.4s
	uxtl	v1.8h, v19.8b
	uxtl	v0.8h, v20.8b
	fcvtnu	v4.4s, v4.4s
	fcvtnu	v3.4s, v3.4s
	uxtl2	v24.4s, v1.8h
	uxtl	v25.4s, v1.4h
	uxtl	v2.4s, v0.4h
	uxtl2	v1.4s, v0.8h
	xtn	v26.4h, v4.4s
	xtn2	v26.8h, v3.4s
	uxtl	v0.8h, v21.8b
	xtn	v22.8b, v23.8h
	xtn2	v22.16b, v26.8h
	ucvtf	v3.4s, v24.4s
	ucvtf	v25.4s, v25.4s
	ucvtf	v2.4s, v2.4s
	uxtl	v23.4s, v0.4h
	uxtl2	v4.4s, v0.8h
	ucvtf	v1.4s, v1.4s
	fmul	v0.4s, v7.4s, v3.4s
	fmul	v24.4s, v7.4s, v25.4s
	fmul	v2.4s, v5.4s, v2.4s
	fmul	v1.4s, v5.4s, v1.4s
	ucvtf	v23.4s, v23.4s
	ucvtf	v4.4s, v4.4s
	fadd	v2.4s, v2.4s, v24.4s
	fadd	v1.4s, v1.4s, v0.4s
	fmul	v23.4s, v6.4s, v23.4s
	fmul	v4.4s, v4.4s, v6.4s
	mov	v16.16b, v22.16b
	mov	v17.16b, v22.16b
	fadd	v2.4s, v2.4s, v23.4s
	fadd	v1.4s, v1.4s, v4.4s
	mov	v18.16b, v22.16b
	uxtl2	v0.8h, v20.16b
	fcvtnu	v2.4s, v2.4s
	fcvtnu	v1.4s, v1.4s
	uxtl2	v3.8h, v19.16b
	st3	{v16.16b - v18.16b}, [x2], 48
	uxtl2	v20.8h, v21.16b
	xtn	v23.4h, v2.4s
	xtn2	v23.8h, v1.4s
	cmp	x0, x3
	bhi	.L3
.L2:
	uxtl	v19.4s, v3.4h
	uxtl	v1.4s, v0.4h
	uxtl2	v2.4s, v0.8h
	uxtl2	v3.4s, v3.8h
	uxtl	v4.4s, v20.4h
	ucvtf	v0.4s, v1.4s
	ucvtf	v2.4s, v2.4s
	ucvtf	v3.4s, v3.4s
	uxtl2	v1.4s, v20.8h
	ucvtf	v19.4s, v19.4s
	ucvtf	v4.4s, v4.4s
	ucvtf	v1.4s, v1.4s
	fmul	v19.4s, v7.4s, v19.4s
	fmul	v7.4s, v7.4s, v3.4s
	fmul	v3.4s, v5.4s, v0.4s
	fmul	v0.4s, v5.4s, v2.4s
	fadd	v2.4s, v3.4s, v19.4s
	fadd	v0.4s, v0.4s, v7.4s
	fmul	v3.4s, v6.4s, v4.4s
	fmul	v6.4s, v6.4s, v1.4s
	fadd	v1.4s, v2.4s, v3.4s
	fadd	v0.4s, v0.4s, v6.4s
	fcvtnu	v1.4s, v1.4s
	fcvtnu	v0.4s, v0.4s
	xtn	v2.4h, v1.4s
	xtn2	v2.8h, v0.4s
	xtn	v0.8b, v23.8h
	xtn2	v0.16b, v2.8h
	mov	v1.16b, v0.16b
	mov	v2.16b, v0.16b
	mov	v3.16b, v0.16b
	st3	{v1.16b - v3.16b}, [x2]
	ret
	.cfi_endproc
.LFE4340:
	.size	monochrome32ip, .-monochrome32ip
	.data
	.align	4
	.set	.LANCHOR0,. + 0
	.type	float_mono_r, %object
	.size	float_mono_r, 16
float_mono_r:
	.word	1050220167
	.word	1050220167
	.word	1050220167
	.word	1050220167
	.type	float_mono_g, %object
	.size	float_mono_g, 16
float_mono_g:
	.word	1058424226
	.word	1058424226
	.word	1058424226
	.word	1058424226
	.type	float_mono_b, %object
	.size	float_mono_b, 16
float_mono_b:
	.word	1038710997
	.word	1038710997
	.word	1038710997
	.word	1038710997
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
