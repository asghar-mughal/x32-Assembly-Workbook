include includes\masm32rt.inc
.data
	fname	db "C:\asmlab\lab20\hello.txt", 0
	text	db "Hello, file!", 13, 10, "Second line", 13, 10, 0
	hFile	dd ?
	nwritten	dd ?
	errnum	dd ?
.code
start:
	invoke CreateFile, addr fname, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
	mov hFile, eax                  ; keep the handle
	.if hFile == INVALID_HANDLE_VALUE
		invoke GetLastError
		mov errnum, eax
		print "Cannot create the file, error "
		print str$(errnum)
		print chr$(13, 10)
		exit
	.endif

	invoke lstrlen, addr text       ; the number of bytes to write
	invoke WriteFile, hFile, addr text, eax, addr nwritten, NULL
	invoke CloseHandle, hFile

	print "Bytes written: "
	print str$(nwritten)
	print chr$(13, 10)
	exit
end start
