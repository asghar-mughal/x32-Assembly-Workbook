include includes\masm32rt.inc
.code
start:
	mov eax, 0CCh           ; 1100 1100
	and eax, 0AAh           ; and with 1010 1010

	mov eax, 0CCh
	or  eax, 0AAh

	mov eax, 0CCh
	xor eax, 0AAh

	mov eax, 0CCh
	not eax

	xor eax, eax            ; a common way to set eax to zero

	exit
end start
