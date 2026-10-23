include includes\masm32rt.inc
.code
start:
	mov eax, 5
	mov ebx, 9
	sub eax, ebx            ; 5 - 9

	mov ecx, 0FFFFFFFFh
	add ecx, 1              ; largest unsigned value plus 1

	mov edx, 7FFFFFFFh
	add edx, 1              ; largest signed value plus 1

	mov esi, 3
	sub esi, 3              ; 3 - 3

	exit
end start
