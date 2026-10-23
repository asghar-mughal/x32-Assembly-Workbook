include includes\masm32rt.inc
.data
	dividend	dd 47
	divisor		dd 5
	quotient	dd ?
	remainder	dd ?
.code
start:
	mov eax, dividend
	xor edx, edx            ; upper half = 0
	div divisor             ; EAX = quotient, EDX = remainder
	mov quotient, eax
	mov remainder, edx

	print "47 / 5 = "
	print str$(quotient)
	print "  remainder "
	print str$(remainder)
	print chr$(13, 10)

	exit
end start
