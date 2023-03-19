	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
Lloh0:
	adrp	x8, _i@PAGE
Lloh1:
	ldr	w8, [x8, _i@PAGEOFF]
	adrp	x9, _j@PAGE
	ldr	w10, [x9, _j@PAGEOFF]
	cmp	w8, #123
	mov	w8, #1
	cneg	w8, w8, ne; if the condition in l14 is not true, multiply w8 with -1
	add	w0, w8, w10
	str	w0, [x9, _j@PAGEOFF]
	ret
	.loh AdrpLdr	Lloh0, Lloh1
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
