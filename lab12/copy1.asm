include includes\masm32rt.inc
.data
	src	db "Hello, assembly!", 0
	dst	db 20 dup('#'), 0           ; 20 hash signs and a zero
.code
start:
	cld
	mov esi, offset src             ; source
	mov edi, offset dst             ; destination
	mov ecx, SIZEOF src             ; bytes to copy (includes the zero)
	rep movsb

	print offset dst
	print chr$(13, 10)
	exit
end start
