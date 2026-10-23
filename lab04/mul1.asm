include includes\masm32rt.inc
.data
	x	dd 6
	y	dd 7
	product	dd ?
.code
start:
	mov eax, x
	mul y                   ; EDX:EAX = EAX * y
	mov product, eax

	print "6 * 7 = "
	print str$(product)
	print chr$(13, 10)

	exit
end start
