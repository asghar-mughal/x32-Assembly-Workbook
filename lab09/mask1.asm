include includes\masm32rt.inc
.data
	status	db 00000000b
.code
start:
	or  status, 00000001b   ; set bit 0 (power on)
	or  status, 00001000b   ; set bit 3 (busy)
	and status, 11110111b   ; clear bit 3 (not busy)
	xor status, 00000010b   ; toggle bit 1 (ready)

	test status, 00000100b  ; is the error bit set?
	jz  no_error
	print "Error bit is set", 13, 10
	jmp done
no_error:
	print "Error bit is clear", 13, 10
done:
	exit
end start
