	.arch armv8-a
	.file	"monochrome16i.c"
	.text
	.align	2
	.p2align 3,,7
	.global	monochrome16i
	.type	monochrome16i, %function
monochrome16i:
	cbz	x0, .L1
	add	x0, x0, x0, lsl 1
	mov	w4, 8192
	add	x5, x1, x0
	mov	w3, 16384
	mov	w0, 32768
	movk	w4, 0x3e99, lsl 16
	movk	w3, 0x3f16, lsl 16
	movk	w0, 0x3de9, lsl 16
	fmov	s5, w4
	fmov	s4, w3
	fmov	s3, w0
	.p2align 3
.L3:
	ldrb	w0, [x1]
	add	x1, x1, 3
	ldrb	w4, [x1, -2]
	add	x2, x2, 3
	cmp	x1, x5
	ucvtf	s0, w0
	ucvtf	s2, w4
	ldrb	w3, [x1, -1]
	fmul	s0, s0, s5
	ucvtf	s1, w3
	fmul	s2, s2, s4
	fmul	s1, s1, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	fcvtzu	w0, s0
	and	w0, w0, 255
	strb	w0, [x2, -3]
	strb	w0, [x2, -2]
	strb	w0, [x2, -1]
	bne	.L3
.L1:
	ret
	.size	monochrome16i, .-monochrome16i
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
