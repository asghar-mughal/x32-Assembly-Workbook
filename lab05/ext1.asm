include includes\masm32rt.inc
.data
	small	db 0FFh
	zext	dd ?
	sext	dd ?
.code
start:
	movzx eax, small        ; zero-extend the byte into 32 bits
	mov zext, eax

	movsx eax, small        ; sign-extend the byte into 32 bits
	mov sext, eax

	print "zero-extended = "
	print str$(zext)
	print chr$(13, 10)

	print "sign-extended = "
	print str$(sext)
	print chr$(13, 10)

	exit
end start
