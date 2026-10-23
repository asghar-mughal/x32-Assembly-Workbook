include includes\masm32rt.inc
.data
	linebuf	db 32 dup(?)
.code
start:
	cld
	mov edi, offset linebuf
	mov al, '*'                     ; the byte to store
	mov ecx, 20                     ; how many
	rep stosb
	mov byte ptr [edi], 0           ; edi points just past the stars

	print offset linebuf
	print chr$(13, 10)
	exit
end start
