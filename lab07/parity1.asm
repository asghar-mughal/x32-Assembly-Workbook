include includes\masm32rt.inc
.data
	num	dd 17
.code
start:
	mov eax, num
	xor edx, edx
	mov ebx, 2
	div ebx                 ; edx = remainder

	cmp edx, 0              ; test the remainder
	jne is_odd

	print "Even", 13, 10
	jmp done
is_odd:
	print "Odd", 13, 10
done:
	exit
end start
