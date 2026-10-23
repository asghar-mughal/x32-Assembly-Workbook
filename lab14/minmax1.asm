include includes\masm32rt.inc
.data
	nums	dd 25, 7, 42, -3, 18, 31
	lo	dd ?
	hi	dd ?
.code
minmax proc uses esi edi ebx arr:DWORD, n:DWORD, pmin:DWORD, pmax:DWORD
	mov esi, arr
	mov ecx, n                  ; n must be at least 1
	mov eax, [esi]              ; smallest so far
	mov ebx, [esi]              ; largest so far
	add esi, 4
	dec ecx
	jz  mm_done                 ; only one element
mm_loop:
	mov edx, [esi]
	cmp edx, eax
	jge not_less
	mov eax, edx
not_less:
	cmp edx, ebx
	jle not_more
	mov ebx, edx
not_more:
	add esi, 4
	dec ecx
	jnz mm_loop
mm_done:
	mov edi, pmin
	mov [edi], eax              ; *pmin = smallest
	mov edi, pmax
	mov [edi], ebx              ; *pmax = largest
	ret
minmax endp

start:
	invoke minmax, offset nums, LENGTHOF nums, addr lo, addr hi

	print "Smallest = "
	print str$(lo)
	print chr$(13, 10)
	print "Largest  = "
	print str$(hi)
	print chr$(13, 10)
	exit
end start
