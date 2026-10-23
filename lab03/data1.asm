include includes\masm32rt.inc
.data
	num1	dd 5
	num2	dd 9
	result	dd ?
.code
start:
	mov eax, num1           ; copy the value stored in num1 into eax
	add eax, num2           ; eax = eax + the value stored in num2
	mov result, eax         ; store eax in the variable result

	print "5 + 9 = "
	print str$(result)      ; convert the variable to text and print it
	print chr$(13, 10)

	exit
end start
