include includes\masm32rt.inc
.code
start:
	print "Before the jump", 13, 10
	jmp skip
	print "This line is never printed", 13, 10
skip:
	print "After the jump", 13, 10
	exit
end start
