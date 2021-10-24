	.arch armv8-a
	.file	"monochrome32ip.c"
	.text
	.align	2
	.p2align 3,,7
	.global	monochrome32ip
	.type	monochrome32ip, %function
monochrome32ip:
	ld3	{v19.16b - v21.16b}, [x1], 48
	adrp	x4, .LANCHOR0
	add	x3, x4, :lo12:.LANCHOR0
	cmp	x0, 16
	ldr	q6, [x4, #:lo12:.LANCHOR0]
#APP
// 8806 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v7.8h,v19.16b,#0
// 0 "" 2
#NO_APP
	ldr	q4, [x3, 16]
#APP
// 8806 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v2.8h,v20.16b,#0
// 0 "" 2
#NO_APP
	dup	d1, v19.d[0]
	dup	d3, v20.d[0]
#APP
// 8878 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v1.8h,v1.8b,#0
// 0 "" 2
// 8878 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v3.8h,v3.8b,#0
// 0 "" 2
#NO_APP
	dup	d0, v1.d[0]
	dup	d17, v3.d[0]
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v0.4s,v0.4h,#0
// 0 "" 2
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v17.4s,v17.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v0.4s, v0.4s
	ucvtf	v17.4s, v17.4s
	ldr	q5, [x3, 32]
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v16.4s,v3.8h,#0
// 0 "" 2
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v1.4s,v1.8h,#0
// 0 "" 2
#NO_APP
	fmul	v17.4s, v17.4s, v4.4s
	dup	d3, v21.d[0]
	ucvtf	v1.4s, v1.4s
#APP
// 8878 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v3.8h,v3.8b,#0
// 0 "" 2
#NO_APP
	ucvtf	v16.4s, v16.4s
	dup	d18, v3.d[0]
	fmul	v0.4s, v0.4s, v6.4s
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v18.4s,v18.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v18.4s, v18.4s
	fmul	v1.4s, v1.4s, v6.4s
	fadd	v0.4s, v0.4s, v17.4s
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v3.4s,v3.8h,#0
// 0 "" 2
#NO_APP
	fmul	v16.4s, v16.4s, v4.4s
	ucvtf	v3.4s, v3.4s
	fmul	v18.4s, v18.4s, v5.4s
#APP
// 8806 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v17.8h,v21.16b,#0
// 0 "" 2
#NO_APP
	fadd	v1.4s, v1.4s, v16.4s
	fmul	v3.4s, v3.4s, v5.4s
	fadd	v0.4s, v0.4s, v18.4s
	fadd	v1.4s, v1.4s, v3.4s
	fcvtnu	v0.4s, v0.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v0.4h,v0.4s
// 0 "" 2
#NO_APP
	mov	v0.8b, v0.8b
	fcvtnu	v1.4s, v1.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v1.4h,v1.4s
// 0 "" 2
#NO_APP
	ins	v0.d[1], v1.d[0]
	mov	v1.16b, v0.16b
	bls	.L2
	mov	x4, 16
	.p2align 3
.L3:
	dup	d3, v7.d[0]
	add	x4, x4, 16
	dup	d0, v2.d[0]
	cmp	x0, x4
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v3.4s,v3.4h,#0
// 0 "" 2
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v0.4s,v0.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v3.4s, v3.4s
	ucvtf	v0.4s, v0.4s
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v18.4s,v7.8h,#0
// 0 "" 2
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v7.4s,v2.8h,#0
// 0 "" 2
#NO_APP
	fmul	v3.4s, v6.4s, v3.4s
	dup	d2, v17.d[0]
	ucvtf	v18.4s, v18.4s
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v2.4s,v2.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v7.4s, v7.4s
	ucvtf	v2.4s, v2.4s
	fmul	v0.4s, v4.4s, v0.4s
	fmul	v18.4s, v6.4s, v18.4s
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v17.4s,v17.8h,#0
// 0 "" 2
#NO_APP
	fmul	v2.4s, v5.4s, v2.4s
	fadd	v0.4s, v0.4s, v3.4s
	ucvtf	v17.4s, v17.4s
	fmul	v7.4s, v4.4s, v7.4s
	ld3	{v19.16b - v21.16b}, [x1], 48
#APP
// 9022 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v1.8b,v1.8h
// 0 "" 2
#NO_APP
	fmul	v17.4s, v5.4s, v17.4s
	mov	v16.8b, v1.8b
	fadd	v7.4s, v7.4s, v18.4s
	fadd	v0.4s, v0.4s, v2.4s
	dup	d1, v19.d[0]
	dup	d3, v20.d[0]
#APP
// 8878 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v1.8h,v1.8b,#0
// 0 "" 2
// 8878 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v3.8h,v3.8b,#0
// 0 "" 2
#NO_APP
	fadd	v7.4s, v7.4s, v17.4s
	dup	d18, v1.d[0]
	dup	d2, v3.d[0]
	fcvtnu	v0.4s, v0.4s
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v18.4s,v18.4h,#0
// 0 "" 2
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v0.4h,v0.4s
// 0 "" 2
#NO_APP
	ucvtf	v18.4s, v18.4s
	mov	v0.8b, v0.8b
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v2.4s,v2.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v2.4s, v2.4s
	dup	d17, v21.d[0]
	fcvtnu	v7.4s, v7.4s
	fmul	v18.4s, v6.4s, v18.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v7.4h,v7.4s
// 0 "" 2
#NO_APP
	ins	v0.d[1], v7.d[0]
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v7.4s,v1.8h,#0
// 0 "" 2
// 9022 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v0.8b,v0.8h
// 0 "" 2
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v1.4s,v3.8h,#0
// 0 "" 2
#NO_APP
	ins	v16.d[1], v0.d[0]
	ucvtf	v7.4s, v7.4s
	fmul	v0.4s, v4.4s, v2.4s
	ucvtf	v1.4s, v1.4s
#APP
// 8878 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v2.8h,v17.8b,#0
// 0 "" 2
#NO_APP
	dup	d17, v2.d[0]
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v17.4s,v17.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v17.4s, v17.4s
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v3.4s,v2.8h,#0
// 0 "" 2
#NO_APP
	fadd	v0.4s, v0.4s, v18.4s
	fmul	v2.4s, v6.4s, v7.4s
	fmul	v17.4s, v5.4s, v17.4s
	ucvtf	v3.4s, v3.4s
	fmul	v1.4s, v4.4s, v1.4s
	mov	v22.16b, v16.16b
	fadd	v0.4s, v0.4s, v17.4s
	fmul	v3.4s, v5.4s, v3.4s
	fadd	v1.4s, v1.4s, v2.4s
	mov	v23.16b, v16.16b
	fcvtnu	v0.4s, v0.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v0.4h,v0.4s
// 0 "" 2
#NO_APP
	fadd	v1.4s, v1.4s, v3.4s
	mov	v0.8b, v0.8b
	mov	v24.16b, v16.16b
#APP
// 8806 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v7.8h,v19.16b,#0
// 0 "" 2
#NO_APP
	fcvtnu	v1.4s, v1.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v1.4h,v1.4s
// 0 "" 2
#NO_APP
	ins	v0.d[1], v1.d[0]
	st3	{v22.16b - v24.16b}, [x2], 48
#APP
// 8806 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v2.8h,v20.16b,#0
// 0 "" 2
// 8806 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v17.8h,v21.16b,#0
// 0 "" 2
#NO_APP
	mov	v1.16b, v0.16b
	bhi	.L3
.L2:
	dup	d16, v7.d[0]
	dup	d3, v2.d[0]
#APP
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v16.4s,v16.4h,#0
// 0 "" 2
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v3.4s,v3.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v16.4s, v16.4s
	ucvtf	v3.4s, v3.4s
	dup	d0, v17.d[0]
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v7.4s,v7.8h,#0
// 0 "" 2
#NO_APP
	fmul	v16.4s, v6.4s, v16.4s
	ucvtf	v7.4s, v7.4s
	fmul	v3.4s, v4.4s, v3.4s
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v2.4s,v2.8h,#0
// 0 "" 2
// 8890 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll v0.4s,v0.4h,#0
// 0 "" 2
#NO_APP
	ucvtf	v2.4s, v2.4s
	ucvtf	v0.4s, v0.4s
	fmul	v6.4s, v6.4s, v7.4s
	fadd	v3.4s, v3.4s, v16.4s
	fmul	v2.4s, v4.4s, v2.4s
	fmul	v7.4s, v5.4s, v0.4s
#APP
// 8818 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	ushll2 v17.4s,v17.8h,#0
// 0 "" 2
#NO_APP
	ucvtf	v17.4s, v17.4s
	fadd	v2.4s, v2.4s, v6.4s
	fadd	v3.4s, v3.4s, v7.4s
#APP
// 9022 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v0.8b,v1.8h
// 0 "" 2
#NO_APP
	fmul	v5.4s, v5.4s, v17.4s
	mov	v0.8b, v0.8b
	fcvtnu	v3.4s, v3.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v3.4h,v3.4s
// 0 "" 2
#NO_APP
	fadd	v2.4s, v2.4s, v5.4s
	mov	v3.8b, v3.8b
	fcvtnu	v2.4s, v2.4s
#APP
// 9034 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v2.4h,v2.4s
// 0 "" 2
#NO_APP
	ins	v3.d[1], v2.d[0]
#APP
// 9022 "/usr/lib/gcc/aarch64-linux-gnu/7/include/arm_neon.h" 1
	xtn v3.8b,v3.8h
// 0 "" 2
#NO_APP
	ins	v0.d[1], v3.d[0]
	mov	v1.16b, v0.16b
	mov	v2.16b, v0.16b
	mov	v3.16b, v0.16b
	st3	{v1.16b - v3.16b}, [x2]
	ret
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
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
