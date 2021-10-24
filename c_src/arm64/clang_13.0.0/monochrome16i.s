	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0
	.globl	_monochrome16i                  ; -- Begin function monochrome16i
	.p2align	2
_monochrome16i:                         ; @monochrome16i
	.cfi_startproc
; %bb.0:                                ; %entry
	cbz	x0, LBB0_3
; %bb.1:                                ; %for.body.preheader
	mov	x8, #0
	mov	w9, #13513
	dup.8h	v0, w9
	mov	w9, #14514
	dup.8h	v1, w9
	mov	w9, #12108
	dup.8h	v2, w9
LBB0_2:                                 ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	ld3.16b	{ v3, v4, v5 }, [x1], #48
	ushll.8h	v6, v3, #0
	ushll2.4s	v7, v6, #0
	ucvtf.4s	v7, v7
	ushll.4s	v6, v6, #0
	fcvtn	v7.4h, v7.4s
	ucvtf.4s	v6, v6
	fcvtn	v6.4h, v6.4s
	ushll.8h	v16, v4, #0
	ushll2.4s	v17, v16, #0
	ucvtf.4s	v17, v17
	fcvtn	v17.4h, v17.4s
	ushll.4s	v16, v16, #0
	ucvtf.4s	v16, v16
	ushll.8h	v18, v5, #0
	ushll2.4s	v19, v18, #0
	ucvtf.4s	v19, v19
	fcvtn	v16.4h, v16.4s
	fcvtn	v19.4h, v19.4s
	ushll.4s	v18, v18, #0
	ucvtf.4s	v18, v18
	fcvtn	v18.4h, v18.4s
	mov.d	v6[1], v7[0]
	ushll2.8h	v7, v3, #0
	ushll2.4s	v20, v7, #0
	ucvtf.4s	v20, v20
	fcvtn	v20.4h, v20.4s
	mov.d	v16[1], v17[0]
	ushll.4s	v7, v7, #0
	ucvtf.4s	v7, v7
	fcvtn	v7.4h, v7.4s
	ushll2.8h	v17, v4, #0
	mov.d	v18[1], v19[0]
	ushll2.4s	v19, v17, #0
	ucvtf.4s	v19, v19
	fcvtn	v19.4h, v19.4s
	ushll.4s	v17, v17, #0
	mov.d	v7[1], v20[0]
	ucvtf.4s	v17, v17
	fcvtn	v17.4h, v17.4s
	mov.d	v17[1], v19[0]
	fmul.8h	v6, v6, v0
	fmul.8h	v16, v16, v1
	fadd.8h	v6, v6, v16
	fmul.8h	v16, v18, v2
	fmul.8h	v7, v7, v0
	fmul.8h	v17, v17, v1
	ushll2.8h	v3, v5, #0
	fadd.8h	v4, v7, v17
	ushll2.4s	v5, v3, #0
	ucvtf.4s	v5, v5
	fcvtn	v5.4h, v5.4s
	ushll.4s	v3, v3, #0
	ucvtf.4s	v3, v3
	fadd.8h	v6, v16, v6
	fcvtn	v3.4h, v3.4s
	mov.d	v3[1], v5[0]
	fmul.8h	v3, v3, v2
	fadd.8h	v3, v3, v4
	fcvtnu.8h	v4, v6
	fcvtnu.8h	v3, v3
	xtn.8b	v4, v4
	xtn2.16b	v4, v3
	mov.16b	v5, v4
	mov.16b	v6, v4
	st3.16b	{ v4, v5, v6 }, [x2], #48
	add	x8, x8, #16                     ; =16
	cmp	x8, x0
	b.lo	LBB0_2
LBB0_3:                                 ; %for.cond.cleanup
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
