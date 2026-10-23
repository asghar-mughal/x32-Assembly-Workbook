include includes\masm32rt.inc
option nokeyword:<c>
.data
	a	dd 10
	b	dd 5
	c	dd 4
	d	dd 20
	e	dd 3
	result	dd ?
.code
start:
	; step 1: (a + b) * c
	mov eax, a
	add eax, b              ; 15
	mul c                   ; 60
	mov ebx, eax            ; keep 60 in ebx

	; step 2: d / e
	mov eax, d
	xor edx, edx
	div e                   ; 20 / 3 = 6

	; step 3: subtract
	sub ebx, eax            ; 60 - 6
	mov result, ebx

	print "(a + b) * c - d / e = "
	print str$(result)
	print chr$(13, 10)

	exit
end start
