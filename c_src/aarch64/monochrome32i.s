	.arch armv8-a
	.file	"monochrome32i.c"
	.text
	.align	2
	.p2align 3,,7
	.global	monochrome32i
	.type	monochrome32i, %function
monochrome32i:
	adrp	x4, .LANCHOR0
	add	x3, x4, :lo12:.LANCHOR0
	ldr	q3, [x4, #:lo12:.LANCHOR0]
	ldr	q4, [x3, 16]
	ldr	q5, [x3, 32]
	cbz	x0, .L1
	mov	x4, 0
	.p2align 3
.L3:
	ld3	{v22.16b - v24.16b}, [x1], 48
#APP
// 8806 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v6.8h,v22.16b,#0
// 0 "" 2
// 8806 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v18.8h,v23.16b,#0
// 0 "" 2
#NO_APP
	dup	d20, v6.d[0]
	add	x4, x4, 16
	dup	d7, v22.d[0]
	cmp	x0, x4
#APP
// 8878 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v7.8h,v7.8b,#0
// 0 "" 2
#NO_APP
	dup	d2, v23.d[0]
	dup	d17, v7.d[0]
#APP
// 8878 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v2.8h,v2.8b,#0
// 0 "" 2
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v17.4s,v17.4h,#0
// 0 "" 2
#NO_APP
	dup	d0, v2.d[0]
	ucvtf	v17.4s, v17.4s
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v0.4s,v0.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v0.4s, v0.4s
	dup	d1, v18.d[0]
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v16.4s,v7.8h,#0
// 0 "" 2
#NO_APP
	fmul	v17.4s, v3.4s, v17.4s
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v2.4s,v2.8h,#0
// 0 "" 2
#NO_APP
	dup	d7, v24.d[0]
	ucvtf	v16.4s, v16.4s
#APP
// 8878 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v7.8h,v7.8b,#0
// 0 "" 2
#NO_APP
	ucvtf	v2.4s, v2.4s
	dup	d21, v7.d[0]
	fmul	v0.4s, v4.4s, v0.4s
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v21.4s,v21.4h,#0
// 0 "" 2
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v20.4s,v20.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v21.4s, v21.4s
	ucvtf	v20.4s, v20.4s
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v1.4s,v1.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v1.4s, v1.4s
	fadd	v0.4s, v0.4s, v17.4s
	fmul	v16.4s, v3.4s, v16.4s
#APP
// 8806 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v17.8h,v24.16b,#0
// 0 "" 2
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v7.4s,v7.8h,#0
// 0 "" 2
#NO_APP
	dup	d19, v17.d[0]
	fmul	v21.4s, v5.4s, v21.4s
	ucvtf	v7.4s, v7.4s
	fmul	v2.4s, v4.4s, v2.4s
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v6.4s,v6.8h,#0
// 0 "" 2
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v18.4s,v18.8h,#0
// 0 "" 2
#NO_APP
	ucvtf	v6.4s, v6.4s
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v19.4s,v19.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v18.4s, v18.4s
	ucvtf	v19.4s, v19.4s
	fmul	v1.4s, v4.4s, v1.4s
	fmul	v20.4s, v3.4s, v20.4s
	fadd	v2.4s, v2.4s, v16.4s
	fmul	v18.4s, v18.4s, v4.4s
	fmul	v16.4s, v5.4s, v19.4s
	fadd	v0.4s, v0.4s, v21.4s
	fmul	v7.4s, v5.4s, v7.4s
	fmul	v6.4s, v3.4s, v6.4s
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v17.4s,v17.8h,#0
// 0 "" 2
#NO_APP
	fadd	v1.4s, v1.4s, v20.4s
	ucvtf	v17.4s, v17.4s
	fadd	v6.4s, v6.4s, v18.4s
	fcvtnu	v0.4s, v0.4s
	fadd	v1.4s, v1.4s, v16.4s
	fmul	v17.4s, v17.4s, v5.4s
	fadd	v2.4s, v2.4s, v7.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v0.4h,v0.4s
// 0 "" 2
#NO_APP
	mov	v0.8b, v0.8b
	fcvtnu	v1.4s, v1.4s
	fcvtnu	v2.4s, v2.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v1.4h,v1.4s
// 0 "" 2
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v2.4h,v2.4s
// 0 "" 2
#NO_APP
	mov	v1.8b, v1.8b
	ins	v0.d[1], v2.d[0]
	fadd	v2.4s, v6.4s, v17.4s
#APP
// 9022 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v0.8b,v0.8h
// 0 "" 2
#NO_APP
	mov	v0.8b, v0.8b
	fcvtnu	v2.4s, v2.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v2.4h,v2.4s
// 0 "" 2
#NO_APP
	ins	v1.d[1], v2.d[0]
#APP
// 9022 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v1.8b,v1.8h
// 0 "" 2
#NO_APP
	ins	v0.d[1], v1.d[0]
	mov	v16.16b, v0.16b
	mov	v17.16b, v0.16b
	mov	v18.16b, v0.16b
	st3	{v16.16b - v18.16b}, [x2], 48
	bhi	.L3
.L1:
	ret
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
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
