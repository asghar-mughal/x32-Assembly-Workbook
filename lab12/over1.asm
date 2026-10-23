include includes\masm32rt.inc
.data
	src	db "Hello, assembly!", 0
	dst	db 8 dup(0)
	guard	dd 0DEADBEEFh
.code
start:
	cld
	mov esi, offset src
	mov edi, offset dst
	mov ecx, 12                     ; 12 bytes into an 8-byte buffer
	rep movsb

	print "guard = "
	print hex$(guard)
	print chr$(13, 10)
	exit
end start
