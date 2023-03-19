	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
; int main(void)
; returned value: w0
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
Lloh0:
	adrp	x8, _i@GOTPAGE; load page address for i (lower 12 bits are 0)
Lloh1:
	ldr	x8, [x8, _i@GOTPAGEOFF]; add offset from the page address
	mov	w9, #123
	str	w9, [x8]
	ldr	w9, [x8]
	add	w9, w9, #1
	str	w9, [x8]
Lloh2:
	adrp	x9, _j@GOTPAGE; load page address for j
Lloh3:
	ldr	x9, [x9, _j@GOTPAGEOFF]; add offset from the page address
	mov	w10, #456
	str	w10, [x9]
	ldr	w8, [x8]
	ldr	w10, [x9]
	add	w8, w10, w8
	str	w8, [x9]
	ldr	w0, [x9]
	ret
	.loh AdrpLdrGot	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.comm	_i,4,2                          ; @i
	.comm	_j,4,2                          ; @j
.subsections_via_symbols
