include includes\masm32rt.inc
.code
start:
	mov eax, 5
	mov ebx, 9
	push eax
	push ebx
	pop  eax                ; the last item pushed (ebx) goes into eax
	pop  ebx                ; the first item pushed (eax) goes into ebx
	exit
end start
