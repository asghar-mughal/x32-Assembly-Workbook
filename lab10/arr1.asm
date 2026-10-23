include includes\masm32rt.inc
.data
	scores	dd 10, 20, 30, 40, 50
	bytes	db 1, 2, 3, 4
	zeros	dd 5 dup(0)
.code
start:
	mov eax, LENGTHOF scores    ; number of elements
	mov ebx, SIZEOF scores      ; total bytes
	mov ecx, TYPE scores        ; bytes per element
	mov edx, offset scores      ; address of the first element
	mov esi, [scores]           ; value of element 0
	mov edi, [scores+4]         ; value of element 1
	exit
end start
