	.arch armv8-a
	.file	"monochrome16i.c"
	.text
	.align	2
	.p2align 4,,11
	.global	monochrome16i
	.type	monochrome16i, %function
monochrome16i:
.LFB0:
	.cfi_startproc
	cbz	x0, .L1
	add	x0, x0, x0, lsl 1
	mov	w4, 8192
	add	x3, x1, x0
	mov	w0, 32768
	movk	w4, 0x3e99, lsl 16
	movk	w0, 0x3de9, lsl 16
	fmov	s5, w4
	fmov	s3, w0
	add	w4, w4, 8200192
	fmov	s4, w4
	.p2align 3,,7
.L3:
	ldr	b0, [x1]
	add	x1, x1, 3
	ldr	b2, [x1, -2]
	add	x2, x2, 3
	ucvtf	s0, s0
	ucvtf	s2, s2
	ldr	b1, [x1, -1]
	fmul	s0, s0, s5
	ucvtf	s1, s1
	fmul	s2, s2, s4
	fmul	s1, s1, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	fcvtzu	w0, s0
	and	w0, w0, 255
	strb	w0, [x2, -3]
	strb	w0, [x2, -2]
	strb	w0, [x2, -1]
	cmp	x1, x3
	bne	.L3
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	monochrome16i, .-monochrome16i
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
