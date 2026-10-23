include includes\masm32rt.inc
.data
	scores	dd 10, 20, 30, 40, 50
.code
start:
	mov esi, 2
	lea eax, [scores+esi*4]     ; the address of scores[2]
	mov ebx, [scores+esi*4]     ; the value of scores[2]
	lea edx, [esi+esi*4]        ; esi * 5, no memory involved
	lea ecx, [esi*8+3]          ; esi * 8 + 3
	exit
end start
