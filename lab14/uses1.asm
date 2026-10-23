include includes\masm32rt.inc
.data
	nums	dd 10, 20, 30, 40
	total	dd ?
.code
array_sum proc uses esi p:DWORD, n:DWORD
	mov esi, p                  ; address of the array
	mov ecx, n                  ; number of elements
	xor eax, eax                ; running total
	jecxz sum_done              ; nothing to add
sum_loop:
	add eax, [esi]
	add esi, 4
	dec ecx
	jnz sum_loop
sum_done:
	ret
array_sum endp

start:
	mov esi, 3                  ; the caller's loop counter
again:
	invoke array_sum, offset nums, LENGTHOF nums
	mov total, eax
	print "Sum = "
	print str$(total)
	print chr$(13, 10)
	dec esi
	jnz again
	exit
end start
