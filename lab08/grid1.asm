include includes\masm32rt.inc
.data
	prod	dd ?
.code
start:
	mov esi, 1              ; row
row_loop:
	mov edi, 1              ; column
col_loop:
	mov eax, esi
	mul edi                 ; eax = row * column
	mov prod, eax

	print str$(prod)
	print chr$(9)           ; a tab character

	inc edi
	cmp edi, 5
	jle col_loop

	print chr$(13, 10)
	inc esi
	cmp esi, 5
	jle row_loop
	exit
end start
