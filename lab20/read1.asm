include includes\masm32rt.inc
.data
	fname	db "C:\asmlab\lab20\hello.txt", 0
	hFile	dd ?
	nread	dd ?
	errnum	dd ?
.data?
	buf	db 256 dup(?)
.code
start:
	invoke CreateFile, addr fname, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
	mov hFile, eax
	.if hFile == INVALID_HANDLE_VALUE
		invoke GetLastError
		mov errnum, eax
		print "Cannot open the file, error "
		print str$(errnum)
		print chr$(13, 10)
		exit
	.endif

	invoke ReadFile, hFile, addr buf, 255, addr nread, NULL
	.if eax == 0
		print "Read failed", 13, 10
		invoke CloseHandle, hFile
		exit
	.endif

	mov ecx, nread
	mov byte ptr [buf+ecx], 0       ; add the zero byte at the end
	invoke CloseHandle, hFile

	print "Bytes read: "
	print str$(nread)
	print chr$(13, 10)
	print offset buf
	exit
end start
