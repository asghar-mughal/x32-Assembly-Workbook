include includes\masm32rt.inc
.code
start:
	mov ecx, 5
again:
	print "Hello", 13, 10
	loop again
	exit
end start
