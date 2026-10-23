include includes\masm32rt.inc
.data
	x	real8 2.5
.code
start:
	mov eax, dword ptr x+4          ; the high doubleword (sign, exponent, top of the mantissa)
	mov ebx, dword ptr x            ; the low doubleword
	print "2.5 = "
	print hex$(eax)
	print " "
	print hex$(ebx)
	print chr$(13, 10)
	exit
end start
