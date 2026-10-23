include includes\masm32rt.inc
.data?
	buf1	db 16 dup(?)
	buf2	db 16 dup(?)
.data
	num1	dd 0
	num2	dd 0
.code
start:
	print "Dividend: "
	invoke StdIn, addr buf1, 15
	invoke atodw, addr buf1
	mov num1, eax

	print "Divisor : "
	invoke StdIn, addr buf2, 15
	invoke atodw, addr buf2
	mov num2, eax

	cmp num2, 0
	je  div_by_zero         ; protect the division

	mov eax, num1
	xor edx, edx
	div num2
	mov num1, eax           ; reuse num1 for the quotient
	mov num2, edx           ; reuse num2 for the remainder

	print "Quotient  = "
	print str$(num1)
	print chr$(13, 10)
	print "Remainder = "
	print str$(num2)
	print chr$(13, 10)
	jmp done

div_by_zero:
	print "Error: cannot divide by zero", 13, 10

done:
	exit
end start
