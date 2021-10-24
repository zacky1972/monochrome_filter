	.arch armv8-a
	.file	"monochrome32i.c"
	.text
	.align	2
	.p2align 4,,11
	.global	monochrome32i
	.type	monochrome32i, %function
monochrome32i:
.LFB4340:
	.cfi_startproc
	adrp	x4, .LANCHOR0
	add	x3, x4, :lo12:.LANCHOR0
	ldr	q4, [x4, #:lo12:.LANCHOR0]
	ldp	q5, q6, [x3, 16]
	cbz	x0, .L1
	mov	x3, 0
	.p2align 3,,7
.L3:
	ld3	{v22.16b - v24.16b}, [x1], 48
	add	x3, x3, 16
	uxtl	v2.8h, v22.8b
	uxtl	v1.8h, v23.8b
	uxtl2	v0.8h, v22.16b
	uxtl2	v20.8h, v23.16b
	uxtl	v19.8h, v24.8b
	uxtl2	v7.8h, v24.16b
	uxtl	v25.4s, v0.4h
	uxtl	v26.4s, v2.4h
	uxtl2	v21.4s, v2.8h
	uxtl	v3.4s, v1.4h
	uxtl	v2.4s, v20.4h
	uxtl2	v1.4s, v1.8h
	uxtl2	v0.4s, v0.8h
	uxtl2	v20.4s, v20.8h
	uxtl	v23.4s, v19.4h
	ucvtf	v24.4s, v25.4s
	uxtl	v22.4s, v7.4h
	ucvtf	v26.4s, v26.4s
	ucvtf	v21.4s, v21.4s
	ucvtf	v3.4s, v3.4s
	ucvtf	v1.4s, v1.4s
	uxtl2	v19.4s, v19.8h
	ucvtf	v0.4s, v0.4s
	ucvtf	v2.4s, v2.4s
	ucvtf	v20.4s, v20.4s
	uxtl2	v7.4s, v7.8h
	fmul	v21.4s, v4.4s, v21.4s
	fmul	v25.4s, v4.4s, v26.4s
	fmul	v20.4s, v20.4s, v5.4s
	fmul	v3.4s, v5.4s, v3.4s
	fmul	v1.4s, v5.4s, v1.4s
	ucvtf	v23.4s, v23.4s
	ucvtf	v19.4s, v19.4s
	fmul	v24.4s, v4.4s, v24.4s
	fmul	v0.4s, v0.4s, v4.4s
	fmul	v2.4s, v5.4s, v2.4s
	ucvtf	v22.4s, v22.4s
	ucvtf	v7.4s, v7.4s
	fadd	v1.4s, v1.4s, v21.4s
	fadd	v0.4s, v0.4s, v20.4s
	fadd	v3.4s, v3.4s, v25.4s
	fmul	v7.4s, v7.4s, v6.4s
	fmul	v21.4s, v6.4s, v23.4s
	fmul	v19.4s, v6.4s, v19.4s
	fadd	v2.4s, v2.4s, v24.4s
	fmul	v20.4s, v22.4s, v6.4s
	fadd	v0.4s, v0.4s, v7.4s
	fadd	v3.4s, v3.4s, v21.4s
	fadd	v1.4s, v1.4s, v19.4s
	fadd	v2.4s, v2.4s, v20.4s
	fcvtnu	v0.4s, v0.4s
	fcvtnu	v3.4s, v3.4s
	fcvtnu	v1.4s, v1.4s
	fcvtnu	v2.4s, v2.4s
	xtn	v7.4h, v3.4s
	xtn2	v7.8h, v1.4s
	xtn	v1.4h, v2.4s
	xtn2	v1.8h, v0.4s
	xtn	v0.8b, v7.8h
	xtn2	v0.16b, v1.8h
	mov	v1.16b, v0.16b
	mov	v2.16b, v0.16b
	mov	v3.16b, v0.16b
	st3	{v1.16b - v3.16b}, [x2], 48
	cmp	x0, x3
	bhi	.L3
.L1:
	ret
	.cfi_endproc
.LFE4340:
	.size	monochrome32i, .-monochrome32i
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
