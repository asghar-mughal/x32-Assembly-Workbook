include includes\masm32rt.inc
.data
	scores	dd 10, 20, 30, 40, 50
	total	dd ?
.code
start:
	mov esi, offset scores      ; esi points to element 0
	mov ecx, LENGTHOF scores
	mov eax, 0
ptr_loop:
	add eax, [esi]              ; add the value at the pointer
	add esi, 4                  ; move to the next doubleword
	loop ptr_loop
	mov total, eax

	print "Total = "
	print str$(total)
	print chr$(13, 10)
	exit
end start
