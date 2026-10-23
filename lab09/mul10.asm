include includes\masm32rt.inc
.data
	x	dd 7
	result	dd ?
.code
start:
	mov eax, x
	mov ebx, eax
	shl eax, 3              ; x * 8
	shl ebx, 1              ; x * 2
	add eax, ebx            ; x * 10
	mov result, eax

	print "7 * 10 = "
	print str$(result)
	print chr$(13, 10)
	exit
end start
