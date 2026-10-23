include includes\masm32rt.inc
.code
start:
	mov esi, 1
count_loop:
	print str$(esi)
	print " "
	inc esi
	cmp esi, 10
	jle count_loop
	print chr$(13, 10)
	exit
end start
