include includes\masm32rt.inc
.data
	x	dd 5
	y	dd 9
.code
swap_vals proc pa:DWORD, pb:DWORD
	mov ecx, pa                 ; address of the first variable
	mov edx, pb                 ; address of the second variable
	mov eax, [ecx]              ; value of the first
	xchg eax, [edx]             ; swap it with the second
	mov [ecx], eax              ; store the old second value in the first
	ret
swap_vals endp

start:
	invoke swap_vals, addr x, addr y

	print "x = "
	print str$(x)
	print chr$(13, 10)
	print "y = "
	print str$(y)
	print chr$(13, 10)
	exit
end start
