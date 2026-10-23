; mylib.inc: macros for my programs (Lab Manual 17)
IFNDEF MYLIB_INC
MYLIB_INC equ 1

say macro text:REQ
	print text, 13, 10
endm

showval macro caption:REQ, value:REQ
	print caption
	print str$(value)
	print chr$(13, 10)
endm

swapmem macro a:REQ, b:REQ
	push a
	push b
	pop a
	pop b
endm

; uses: eax
maxof macro dest:REQ, a:REQ, b:REQ
	LOCAL finish
	mov eax, a
	cmp eax, b
	jge finish
	mov eax, b
finish:
	mov dest, eax
endm

; uses: eax
abs_to macro dest:REQ, src:REQ
	mov eax, src
	.if sdword ptr eax < 0
		neg eax
	.endif
	mov dest, eax
endm

ENDIF
