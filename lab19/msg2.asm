include includes\masm32rt.inc
.data
	answer	dd ?
.code
start:
	invoke MessageBox, NULL, chr$("Do you like assembly?"), chr$("Question"), MB_YESNO or MB_ICONQUESTION
	mov answer, eax                 ; save it before print changes eax

	.if answer == IDYES
		print "You said yes", 13, 10
	.elseif answer == IDNO
		print "You said no", 13, 10
	.endif
	exit
end start
