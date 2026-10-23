; mylibp.inc: procedures for my programs
IFNDEF MYLIBP_INC
MYLIBP_INC equ 1

print_array proc uses esi ebx arr:DWORD, cnt:DWORD
	mov esi, arr
	mov ebx, cnt
	.while ebx != 0
		mov eax, [esi]
		print str$(eax)
		print " "
		add esi, 4
		dec ebx
	.endw
	print chr$(13, 10)
	ret
print_array endp

strlen_p proc uses esi p:DWORD
	mov esi, p
	xor eax, eax
	.while byte ptr [esi+eax] != 0
		inc eax
	.endw
	ret
strlen_p endp

ENDIF
