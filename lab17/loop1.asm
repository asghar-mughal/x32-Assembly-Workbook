include includes\masm32rt.inc
.code
start:
	mov esi, 1
	.while esi <= 10
		print str$(esi)
		print " "
		inc esi
	.endw
	print chr$(13, 10)
	exit
end start
