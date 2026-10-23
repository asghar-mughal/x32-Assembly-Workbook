include includes\masm32rt.inc
.data
	a	dd 25
	b	dd 17
	maxv	dd ?
.code
start:
	mov eax, a              ; assume a is the largest
	cmp eax, b
	jge store_max           ; if a >= b, keep a
	mov eax, b              ; otherwise b is the largest
store_max:
	mov maxv, eax

	print "Maximum = "
	print str$(maxv)
	print chr$(13, 10)

	exit
end start
