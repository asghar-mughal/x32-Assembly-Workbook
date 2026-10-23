include includes\masm32rt.inc
.code
start:
	call level1
	exit

level1:
	call level2
	ret
level2:
	call level3
	ret
level3:
	mov eax, 123
	ret
end start
