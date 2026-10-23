include includes\masm32rt.inc
.code
start:
	mov esi, 5
	xor eax, eax
sum_loop:
	add eax, esi
	dec esi
	jnz sum_loop

	cmp eax, 10
	jle small_total
	print "big", 13, 10
	jmp finished
small_total:
	print "small", 13, 10
finished:
	exit
end start
