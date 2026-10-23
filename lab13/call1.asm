include includes\masm32rt.inc
.code
start:
	print "Start", 13, 10
	call say_hello
	call say_hello
	print "End", 13, 10
	exit

say_hello:
	print "Hello from a subroutine", 13, 10
	ret
end start
