include includes\masm32rt.inc
.code
start:
	mov eax, 5
	mov ebx, 5
	cmp eax, ebx            ; test 1: 5 and 5

	mov eax, 3
	mov ebx, 7
	cmp eax, ebx            ; test 2: 3 and 7

	mov eax, 7
	mov ebx, 3
	cmp eax, ebx            ; test 3: 7 and 3

	mov eax, -1
	mov ebx, 1
	cmp eax, ebx            ; test 4: -1 and 1

	mov eax, 80000000h
	mov ebx, 1
	cmp eax, ebx            ; test 5: 80000000h and 1

	exit
end start
