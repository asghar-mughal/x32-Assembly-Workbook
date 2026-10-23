include includes\masm32rt.inc
.data
	nums	dd 10, 20, 30, 40
	total	dd ?
.code
start:
	mov esi, offset nums
	mov ecx, LENGTHOF nums
	call array_sum              ; result in eax
	mov total, eax

	print "Sum = "
	print str$(total)
	print chr$(13, 10)
	exit

array_sum:
	push esi                    ; save the caller's registers
	push ecx
	xor eax, eax                ; running total
sum_loop:
	add eax, [esi]
	add esi, 4
	loop sum_loop
	pop ecx                     ; restore them in the opposite order
	pop esi
	ret
end start
