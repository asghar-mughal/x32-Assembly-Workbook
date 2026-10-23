include includes\masm32rt.inc
.data
	nums	dd 12, 7, 25, 3, 18
	marker	dd 1000
	sum	dd ?
	avg	dd ?
.code
start:
	mov eax, 0
	mov esi, 0
sum_loop:
	add eax, [nums+esi*4]
	inc esi
	cmp esi, LENGTHOF nums
	jle sum_loop
	mov sum, eax

	xor edx, edx
	mov ebx, SIZEOF nums
	div ebx
	mov avg, eax

	print "Sum     = "
	print str$(sum)
	print chr$(13, 10)
	print "Average = "
	print str$(avg)
	print chr$(13, 10)

	mov ecx, LENGTHOF nums
	mov esi, 0
show_loop:
	mov eax, [nums+esi]
	print str$(eax)
	print " "
	inc esi
	loop show_loop
	print chr$(13, 10)
	exit
end start
