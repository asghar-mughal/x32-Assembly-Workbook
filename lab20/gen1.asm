include includes\masm32rt.inc
.data
	fname	db "C:\asmlab\lab20\lines.txt", 0
	hFile	dd ?
	nwritten	dd ?
.data?
	linebuf	db 64 dup(?)
.code
start:
	invoke CreateFile, addr fname, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
	mov hFile, eax
	.if hFile == INVALID_HANDLE_VALUE
		print "Cannot create the file", 13, 10
		exit
	.endif

	mov ebx, 1                      ; linebuf number (kept safe by the API)
	.while ebx <= 100
		invoke wsprintf, addr linebuf, chr$("Line %d", 13, 10), ebx
		invoke WriteFile, hFile, addr linebuf, eax, addr nwritten, NULL
		inc ebx
	.endw

	invoke CloseHandle, hFile
	print "Done", 13, 10
	exit
end start
