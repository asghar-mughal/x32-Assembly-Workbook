include includes\masm32rt.inc
.data
	result	dd ?
.code
start:
	mov eax, -6
	mov ebx, 7
	imul eax, ebx           ; -6 * 7
	mov result, eax

	print "-6 * 7 = "
	print str$(result)
	print chr$(13, 10)

	exit
end start
