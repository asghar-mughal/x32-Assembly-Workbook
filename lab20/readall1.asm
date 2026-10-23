include includes\masm32rt.inc
.data
	fname	db "C:\asmlab\lab20\lines.txt", 0
	hFile	dd ?
	hHeap	dd ?
	pBuf	dd ?
	file_sz	dd ?
	nread	dd ?
.code
start:
	invoke CreateFile, addr fname, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
	mov hFile, eax
	.if hFile == INVALID_HANDLE_VALUE
		print "Cannot open the file", 13, 10
		exit
	.endif

	invoke GetFileSize, hFile, NULL
	mov file_sz, eax

	invoke GetProcessHeap
	mov hHeap, eax
	mov eax, file_sz
	inc eax                         ; one more byte for the zero
	invoke HeapAlloc, hHeap, HEAP_ZERO_MEMORY, eax
	.if eax == NULL
		print "Out of memory", 13, 10
		invoke CloseHandle, hFile
		exit
	.endif
	mov pBuf, eax

	invoke ReadFile, hFile, pBuf, file_sz, addr nread, NULL
	invoke CloseHandle, hFile

	print "File size: "
	print str$(file_sz)
	print chr$(13, 10)
	invoke StdOut, pBuf             ; the block ends with a zero byte

	invoke HeapFree, hHeap, 0, pBuf
	exit
end start
