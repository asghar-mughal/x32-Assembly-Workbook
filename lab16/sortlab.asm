include includes\masm32rt.inc
.data
	nums	dd 25, 7, 42, -3, 18, 31, 9
	compares	dd 0
	swaps	dd 0
	steps	dd 0
	result	dd ?
.code
print_array proc uses esi ebx arr:DWORD, n:DWORD
	mov esi, arr
	mov ebx, n
	test ebx, ebx
	jz  pa_done
pa_loop:
	mov eax, [esi]
	print str$(eax)
	print " "
	add esi, 4
	dec ebx
	jnz pa_loop
pa_done:
	print chr$(13, 10)
	ret
print_array endp

linear_search proc uses esi arr:DWORD, n:DWORD, key:DWORD
	mov esi, arr
	xor ecx, ecx                ; index
ls_loop:
	cmp ecx, n
	jge ls_notfound             ; looked at every element
	inc compares
	mov eax, [esi+ecx*4]
	cmp eax, key
	je  ls_found
	inc ecx
	jmp ls_loop
ls_found:
	mov eax, ecx                ; the index
	ret
ls_notfound:
	mov eax, -1
	ret
linear_search endp

start:
	invoke print_array, offset nums, LENGTHOF nums

	mov compares, 0
	invoke linear_search, offset nums, LENGTHOF nums, 18
	mov result, eax             ; save it before print changes eax

	print "Index of 18 = "
	print str$(result)
	print " after "
	print str$(compares)
	print " comparisons", 13, 10
	exit
end start
