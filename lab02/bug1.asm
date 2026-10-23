include includes\masm32rt.inc
.code
start:
	mov eax, 5
	mov ebx, 9
	add eax, ebx            ; eax = 14

	print "5 + 9 = "
	print str$(eax)
	print chr$(13, 10)

	exit
end start
