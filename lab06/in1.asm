include includes\masm32rt.inc
.data?
	buf	db 64 dup(?)
.code
start:
	print "What is your name? "
	invoke StdIn, addr buf, 63      ; read a line, at most 63 characters

	print "Hello, "
	print offset buf
	print "!", 13, 10

	exit
end start
