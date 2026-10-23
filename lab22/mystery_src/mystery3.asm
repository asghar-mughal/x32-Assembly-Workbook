include includes\masm32rt.inc
.data?
	buf	db 16 dup(?)
.code
start:
	print "How many? "
	invoke StdIn, addr buf, 15
	invoke atodw, addr buf
	mov esi, eax
	mov ebx, 1
	.while esi > 0
		print str$(ebx)
		print " "
		lea ebx, [ebx*2+1]
		dec esi
	.endw
	print chr$(13, 10)
	exit
end start
