include includes\masm32rt.inc
.data?
	path	db 260 dup(?)
.data
	attr	dd ?
	errnum	dd ?
.code
start:
	print "Path: "
	invoke StdIn, addr path, 259

	invoke GetFileAttributes, addr path
	mov attr, eax

	.if attr == 0FFFFFFFFh
		invoke GetLastError         ; ask for the reason at once
		mov errnum, eax
		print "Does not exist, error "
		print str$(errnum)
		print chr$(13, 10)
	.else
		print "Exists, attributes = "
		print hex$(attr)
		print chr$(13, 10)
		test attr, FILE_ATTRIBUTE_DIRECTORY
		.if !ZERO?
			print "It is a directory", 13, 10
		.else
			print "It is a file", 13, 10
		.endif
	.endif
	exit
end start
