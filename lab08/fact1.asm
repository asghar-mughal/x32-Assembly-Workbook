include includes\masm32rt.inc
.data
	result	dd ?
.code
start:
	mov eax, 1              ; running product
	mov ecx, 5              ; n
fact_loop:
	mul ecx                 ; eax = eax * ecx
	loop fact_loop
	mov result, eax

	print "5! = "
	print str$(result)
	print chr$(13, 10)
	exit
end start
