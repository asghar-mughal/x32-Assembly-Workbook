include includes\masm32rt.inc
.code
start:
	print "Hello World", 13, 10
	print "5 + 9 = "

	mov eax, 5
	mov ebx, 9
	add eax, ebx            ; eax = eax + ebx = 14

	print str$(eax)         ; convert number in eax to text and print
	print chr$(13, 10)

	exit
end start
