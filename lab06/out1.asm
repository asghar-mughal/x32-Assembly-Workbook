include includes\masm32rt.inc
.data
	v	dd 255
.code
start:
	print "Line one", 13, 10, "Line two", 13, 10

	print "Signed decimal   : "
	print str$(v)
	print chr$(13, 10)

	print "Unsigned decimal : "
	print ustr$(v)
	print chr$(13, 10)

	print "Hexadecimal      : "
	print hex$(v)
	print chr$(13, 10)

	exit
end start
