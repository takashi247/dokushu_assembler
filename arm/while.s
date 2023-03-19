	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	adrp	x8, _i@PAGE
	ldr	w10, [x8, _i@PAGEOFF]; w10 is i
	adrp	x9, _j@PAGE
	cmp	w10, #1; check if i bigger than or equal to 1 (= bigger than 0)
	b.lt	LBB0_2; if not, go straight to the final branch
; %bb.1:
	ldr	w11, [x9, _j@PAGEOFF]
	add	w10, w11, w10; going through the while loop is equivalent to just adding i to j!
	str	wzr, [x8, _i@PAGEOFF]
	str	w10, [x9, _j@PAGEOFF]
LBB0_2:
	ldr	w0, [x9, _j@PAGEOFF]
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__data
	.globl	_i                              ; @i
	.p2align	2
_i:
	.long	123                             ; 0x7b

	.globl	_j                              ; @j
	.p2align	2
_j:
	.long	456                             ; 0x1c8

.subsections_via_symbols
