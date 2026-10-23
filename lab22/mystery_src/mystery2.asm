include includes\masm32rt.inc
.data?
	buf	db 16 dup(?)
.data
	result	dd ?
.code
start:
	print "Number: "
	invoke StdIn, addr buf, 15
	invoke atodw, addr buf
	mov ebx, eax
	lea eax, [ebx*8]
	sub eax, ebx
	add eax, 5
	mov result, eax
	print "Result: "
	print str$(result)
	print chr$(13, 10)
	exit
end start
