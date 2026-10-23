include includes\masm32rt.inc
.code
start:
	call forever
	exit

forever:
	call forever                ; calls itself again and again
	ret
end start
