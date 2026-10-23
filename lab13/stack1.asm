include includes\masm32rt.inc
.code
start:
	mov eax, 11111111h
	mov ebx, 22222222h
	mov ecx, 33333333h

	push eax                ; 1
	push ebx                ; 2
	push ecx                ; 3

	mov eax, 0
	mov ebx, 0
	mov ecx, 0

	pop ecx                 ; 4
	pop ebx                 ; 5
	pop eax                 ; 6
	exit
end start
