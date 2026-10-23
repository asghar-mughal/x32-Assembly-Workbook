include includes\masm32rt.inc
.data?
	buf	db 16 dup(?)
.code
start:
	print "Enter the secret number: "
	invoke StdIn, addr buf, 15
	invoke atodw, addr buf
	mov ebx, eax
	mov eax, 12
	imul eax, eax, 7            ; 84
	sub eax, 42                 ; 42
	xor eax, 5                  ; 47
	cmp ebx, eax
	jne wrong
	print "Access granted", 13, 10
	exit
wrong:
	print "Access denied", 13, 10
	exit
end start
