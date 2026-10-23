include includes\masm32rt.inc
.data
	n	dd 5
	prod	dd ?
.code
start:
	mov esi, 1
next_row:
	mov eax, esi
	mul n                   ; eax = esi * n
	mov prod, eax           ; save before print changes eax

	print str$(n)
	print " x "
	print str$(esi)
	print " = "
	print str$(prod)
	print chr$(13, 10)

	inc esi
	cmp esi, 10
	jle next_row
	exit
end start
