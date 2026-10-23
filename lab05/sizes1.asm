include includes\masm32rt.inc
.data
	b1	db 0AAh
	w1	dw 1234h
	d1	dd 12345678h
	bytes	db 11h, 22h, 33h, 44h
.code
start:
	mov eax, 0
	mov ebx, 0

	mov al, b1              ; 1 byte
	mov bx, w1              ; 2 bytes
	mov ecx, d1             ; 4 bytes
	mov edx, dword ptr bytes ; four bytes read as one DWORD

	mov al, byte ptr d1     ; lowest byte of d1
	mov ah, byte ptr [d1+1] ; the next byte
	mov dx, word ptr [d1+2] ; the upper two bytes of d1

	exit
end start
