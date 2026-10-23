include includes\masm32rt.inc
MAXCOUNT equ 100
.const
	limit	dd 50
.data?
	buffer	db 16 dup(?)
.data
	counter	dd 0
.code
start:
	mov eax, MAXCOUNT
	mov ebx, limit
	mov counter, eax
	exit
end start
