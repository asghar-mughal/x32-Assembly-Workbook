include includes\masm32rt.inc
.data
	fname	db "C:\asmlab\lab20\notes.txt", 0
	crlf	db 13, 10
	hFile	dd ?
	nwritten	dd ?
	slen	dd ?
	count	dd 0
.data?
	linebuf	db 256 dup(?)
.code
start:
	invoke CreateFile, addr fname, GENERIC_WRITE, 0, NULL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
	mov hFile, eax
	.if hFile == INVALID_HANDLE_VALUE
		print "Cannot open the file", 13, 10
		exit
	.endif
	invoke SetFilePointer, hFile, 0, NULL, FILE_END   ; go to the end

	print "Type your notes. An empty linebuf ends the program.", 13, 10
	.repeat
		print chr$(62, 32)
		invoke StdIn, addr linebuf, 255
		invoke lstrlen, addr linebuf
		mov slen, eax
		.if slen > 0
			invoke WriteFile, hFile, addr linebuf, slen, addr nwritten, NULL
			invoke WriteFile, hFile, addr crlf, 2, addr nwritten, NULL
			inc count
		.endif
	.until slen == 0

	invoke CloseHandle, hFile
	print "Lines saved: "
	print str$(count)
	print chr$(13, 10)
	exit
end start
