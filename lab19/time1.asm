include includes\masm32rt.inc
.data
	t0	dd ?
	elapsed	dd ?
.code
start:
	invoke GetTickCount             ; milliseconds since Windows started
	mov t0, eax

	invoke Sleep, 1500

	invoke GetTickCount
	sub eax, t0
	mov elapsed, eax

	print "Elapsed (ms) = "
	print str$(elapsed)
	print chr$(13, 10)
	exit
end start
