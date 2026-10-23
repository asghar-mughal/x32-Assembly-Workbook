include includes\masm32rt.inc
BUFSIZE equ 512
.data
	src	db "C:\asmlab\lab20\lines.txt", 0
	dst	db "C:\asmlab\lab20\copy.txt", 0
	hIn	dd ?
	hOut	dd ?
	nread	dd 0
	nwritten	dd ?
	total	dd 0
	chunks	dd 0
.data?
	buf	db BUFSIZE dup(?)
.code
start:
	invoke CreateFile, addr src, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
	mov hIn, eax
	.if hIn == INVALID_HANDLE_VALUE
		print "Cannot open the source", 13, 10
		exit
	.endif
	invoke CreateFile, addr dst, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
	mov hOut, eax
	.if hOut == INVALID_HANDLE_VALUE
		print "Cannot create the copy", 13, 10
		invoke CloseHandle, hIn
		exit
	.endif

	.repeat
		invoke ReadFile, hIn, addr buf, BUFSIZE, addr nread, NULL
		.break .if eax == 0         ; a read error
		.if nread != 0
			invoke WriteFile, hOut, addr buf, nread, addr nwritten, NULL
			mov eax, nread
			add total, eax
			inc chunks
		.endif
	.until nread == 0               ; the end of the file

	invoke CloseHandle, hIn
	invoke CloseHandle, hOut

	print "Copied "
	print str$(total)
	print " bytes in "
	print str$(chunks)
	print " chunks", 13, 10
	exit
end start
