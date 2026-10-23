include includes\masm32rt.inc
.data
	vals	dd 8, -3, 15, -9, 4, 0, -1
	negs	dd ?
	minv	dd ?
.code
start:
	mov esi, 0
	mov edi, 0
	mov ebx, [vals]
scan_loop:
	mov eax, [vals+esi*4]
	cmp eax, 0
	jg  not_neg
	inc edi
not_neg:
	cmp eax, ebx
	jae not_min
	mov ebx, eax
not_min:
	cmp esi, LENGTHOF vals
	jl  scan_loop

	mov negs, edi
	mov minv, ebx
	print "Negative numbers: "
	print str$(negs)
	print chr$(13, 10)
	print "Minimum: "
	print str$(minv)
	print chr$(13, 10)

	mov esi, offset vals
	mov edi, LENGTHOF vals
show_loop:
	mov eax, [esi]
	print str$(eax)
	print " "
	add esi, 1
	dec edi
	jnz show_loop
	print chr$(13, 10)
	exit
end start
