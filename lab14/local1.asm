include includes\masm32rt.inc
.data
	result	dd ?
.code
sum_squares proc n:DWORD
	LOCAL total:DWORD
	LOCAL i:DWORD
	mov total, 0
	mov i, 1
sq_loop:
	mov eax, i
	cmp eax, n
	jg  sq_done
	mul eax                     ; eax = i * i
	add total, eax
	inc i
	jmp sq_loop
sq_done:
	mov eax, total              ; the result
	ret
sum_squares endp

start:
	invoke sum_squares, 10
	mov result, eax

	print "1 + 4 + 9 + ... + 100 = "
	print str$(result)
	print chr$(13, 10)
	exit
end start
