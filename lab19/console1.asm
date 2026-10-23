include includes\masm32rt.inc
.data
	hOut	dd ?
	written	dd ?
	msg	db "Written with WriteConsole", 13, 10, 0
.code
start:
	invoke GetStdHandle, STD_OUTPUT_HANDLE
	mov hOut, eax                   ; keep the handle

	invoke lstrlen, addr msg        ; number of characters in eax
	invoke WriteConsole, hOut, addr msg, eax, addr written, NULL

	print "Characters written: "
	print str$(written)
	print chr$(13, 10)
	exit
end start
