include includes\masm32rt.inc
include mylib.inc
.data
	hHeap	dd ?
	pArr	dd ?
	count	dd 10
.code
include mylibp.inc
start:
	invoke GetProcessHeap
	mov hHeap, eax

	mov eax, count
	shl eax, 2                      ; bytes = count * 4
	invoke HeapAlloc, hHeap, HEAP_ZERO_MEMORY, eax
	.if eax == NULL
		say "Out of memory"
		exit
	.endif
	mov pArr, eax                   ; save the address of the block

	mov esi, pArr
	xor ebx, ebx
	.while ebx < count
		mov eax, ebx
		inc eax
		mul eax                     ; eax = (index + 1) squared
		mov [esi+ebx*4], eax
		inc ebx
	.endw

	invoke print_array, pArr, count

	invoke HeapFree, hHeap, 0, pArr
	mov pArr, 0                     ; the pointer is no longer valid
	exit
end start
