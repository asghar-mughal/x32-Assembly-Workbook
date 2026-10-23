include includes\masm32rt.inc
.data
	total	dd ?
.code
start:
	mov eax, 0              ; running total
	mov ecx, 10             ; counter: 10 down to 1
again:
	add eax, ecx            ; total = total + counter
	loop again              ; ecx = ecx - 1, jump if ecx is not 0

	mov total, eax
	print "Sum of 1 to 10 = "
	print str$(total)
	print chr$(13, 10)

	exit
end start
