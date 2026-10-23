include includes\masm32rt.inc
.data?
	buf	db 16 dup(?)
.data
	n	dd 0
	total	dd 0
.code
start:
	print "Sum from 1 to n. Enter n: "
	invoke StdIn, addr buf, 15
	invoke atodw, addr buf
	mov n, eax

	xor eax, eax
	mov esi, 1
sum_loop:
	add eax, esi
	inc esi
	cmp esi, n
	jl  sum_loop            ; BUG (off-by-one): stops before adding n (should be jle)
	mov total, eax

	print "Sum = "
	print str$(total)
	print chr$(13, 10)
	exit
end start
