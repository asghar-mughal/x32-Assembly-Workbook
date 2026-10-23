include includes\masm32rt.inc
.data
	a	dd 20
	b	dd 7
	sum	dd ?
	diff	dd ?
	neg1	dd ?
.code
start:
	mov eax, a
	add eax, b
	mov sum, eax            ; 20 + 7

	mov eax, a
	sub eax, b
	mov diff, eax           ; 20 - 7

	mov eax, b
	neg eax                 ; -7
	mov neg1, eax

	print "a + b = "
	print str$(sum)
	print chr$(13, 10)

	print "a - b = "
	print str$(diff)
	print chr$(13, 10)

	print "-b    = "
	print str$(neg1)
	print chr$(13, 10)

	exit
end start
