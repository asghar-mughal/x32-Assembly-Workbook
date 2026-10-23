include includes\masm32rt.inc
.data
	title1	db "Lab 03: Data and Variables", 13, 10, 0
	msg1	db "First number  = ", 0
	msg2	db "Second number = ", 0
	msg3	db "Sum           = ", 0
	nl	db 13, 10, 0
	num1	dd 25
	num2	dd 17
	sum	dd ?
.code
start:
	mov eax, num1
	add eax, num2
	mov sum, eax            ; save the result in memory

	print offset title1

	print offset msg1
	print str$(num1)
	print offset nl

	print offset msg2
	print str$(num2)
	print offset nl

	print offset msg3
	print str$(sum)
	print offset nl

	exit
end start
