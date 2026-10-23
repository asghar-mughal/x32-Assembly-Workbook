include includes\masm32rt.inc
.code
start:
	mov eax, 12345678h      ; 1: write all 32 bits
	mov al, 0FFh            ; 2: write the low byte only
	mov ah, 00h             ; 3: write the second byte only
	mov ax, 0ABCDh          ; 4: write the low 16 bits
	mov eax, 0              ; 5: clear all 32 bits
	exit
end start
