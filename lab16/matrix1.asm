include includes\masm32rt.inc
ROWS equ 3
COLS equ 4
.data
	matrix	dd 1, 2, 3, 4
		dd 5, 6, 7, 8
		dd 9, 10, 11, 12
	elem	dd ?
.code
print_matrix proc uses esi edi ebx pm:DWORD, nrows:DWORD, ncols:DWORD
	mov esi, pm
	xor ebx, ebx                ; row = 0
pm_row:
	cmp ebx, nrows
	jge pm_done
	xor edi, edi                ; col = 0
pm_col:
	cmp edi, ncols
	jge pm_endrow
	mov eax, ebx
	mul ncols                   ; eax = row * ncols
	add eax, edi                ; + col
	mov eax, [esi+eax*4]        ; the element
	print str$(eax)
	print chr$(9)               ; a tab
	inc edi
	jmp pm_col
pm_endrow:
	print chr$(13, 10)
	inc ebx
	jmp pm_row
pm_done:
	ret
print_matrix endp

start:
	invoke print_matrix, offset matrix, ROWS, COLS

	mov eax, 1                  ; row i = 1
	mov ecx, COLS
	mul ecx                     ; eax = i * COLS
	add eax, 2                  ; + j, with j = 2
	mov ecx, [matrix+eax*4]
	mov elem, ecx

	print "matrix[1][2] = "
	print str$(elem)
	print chr$(13, 10)
	exit
end start
