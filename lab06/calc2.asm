include includes\masm32rt.inc
.data?
	buf1	db 16 dup(?)
	buf2	db 16 dup(?)
.data
	num1	dd 0
	num2	dd 0
	sum	dd 0
	diff	dd 0
	prod	dd 0
	quotient	dd 0
	rem	dd 0
.code
start:
	; ---- read the two numbers (as in calc1) ----
	print "Enter first number : "
	invoke StdIn, addr buf1, 15
	invoke atodw, addr buf1
	mov num1, eax

	print "Enter second number: "
	invoke StdIn, addr buf2, 15
	invoke atodw, addr buf2
	mov num2, eax

	; ---- calculate ----
	mov eax, num1
	add eax, num2
	mov sum, eax

	mov eax, num1
	sub eax, num2
	mov diff, eax

	mov eax, num1
	mul num2
	mov prod, eax

	mov eax, num1
	xor edx, edx
	div num2
	mov quotient, eax
	mov rem, edx

	; ---- print the results ----
	print "Sum        = "
	print str$(sum)
	print chr$(13, 10)

	print "Difference = "
	print str$(diff)
	print chr$(13, 10)

	print "Product    = "
	print str$(prod)
	print chr$(13, 10)

	print "Quotient   = "
	print str$(quotient)
	print chr$(13, 10)

	print "Remainder  = "
	print str$(rem)
	print chr$(13, 10)

	exit
end start
