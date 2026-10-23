include includes\masm32rt.inc
.code
start:
	mov esi, 5              ; ESI is not changed by print
again:
	print "Hello", 13, 10
	dec esi
	jnz again
	exit
end start
