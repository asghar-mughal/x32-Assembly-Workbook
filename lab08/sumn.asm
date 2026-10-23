include includes\masm32rt.inc
.data?
	buf	db 16 dup(?)
.data
	total	dd 0
.code
start:
	print "Enter n: "
	invoke StdIn, addr buf, 15
	invoke atodw, addr buf
	mov ebx, eax            ; ebx = n (kept safe)

	mov esi, 1              ; i = 1
	mov edi, 0              ; running total
sum_loop:
	cmp esi, ebx
	jg  sum_done            ; leave when i > n
	add edi, esi
	inc esi
	jmp sum_loop
sum_done:
	mov total, edi

	print "Sum = "
	print str$(total)
	print chr$(13, 10)
	exit
end start
