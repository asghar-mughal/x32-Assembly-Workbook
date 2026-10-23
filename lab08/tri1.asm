include includes\masm32rt.inc
.code
start:
	mov esi, 1              ; row = 1
row_loop:
	mov edi, 1              ; column = 1 (reset for every row)
col_loop:
	print "*"
	inc edi
	cmp edi, esi
	jle col_loop            ; stay in this row while column <= row

	print chr$(13, 10)      ; end of the row
	inc esi
	cmp esi, 5
	jle row_loop
	exit
end start
