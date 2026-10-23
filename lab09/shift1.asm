include includes\masm32rt.inc
.code
start:
	mov eax, 5
	shl eax, 1              ; test 1

	mov eax, 5
	shl eax, 3              ; test 2

	mov eax, 40
	shr eax, 3              ; test 3

	mov eax, 47
	shr eax, 3              ; test 4

	mov eax, -8
	shr eax, 1              ; test 5: logical shift

	mov eax, -8
	sar eax, 1              ; test 6: arithmetic shift

	mov eax, -5
	sar eax, 1              ; test 7

	mov eax, 80000001h
	rol eax, 1              ; test 8

	mov eax, 3
	ror eax, 1              ; test 9

	mov cl, 4
	mov eax, 1
	shl eax, cl             ; test 10: count in CL

	exit
end start
