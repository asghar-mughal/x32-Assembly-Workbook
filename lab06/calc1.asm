include includes\masm32rt.inc
.data?
	buf1	db 16 dup(?)
	buf2	db 16 dup(?)
.data
	num1	dd 0
	num2	dd 0
	sum	dd 0
.code
start:
	print "First number : "
	invoke StdIn, addr buf1, 15
	invoke atodw, addr buf1         ; text to number, result in eax
	mov num1, eax                   ; keep it

	print "Second number: "
	invoke StdIn, addr buf2, 15
	invoke atodw, addr buf2
	mov num2, eax

	mov eax, num1
	add eax, num2
	mov sum, eax

	print "Sum = "
	print str$(sum)
	print chr$(13, 10)

	exit
end start
