include includes\masm32rt.inc
.data
	oldcw	dw ?
	newcw	dw ?
	x	real8 7.9
	r1	sdword ?
	r2	sdword ?
.code
start:
	fld x
	fistp r1                    ; the default mode: to the nearest

	fnstcw oldcw                ; save the control word
	mov ax, oldcw
	or  ax, 0C00h               ; rounding control = 11: truncate
	mov newcw, ax
	fldcw newcw
	fld x
	fistp r2                    ; now truncated
	fldcw oldcw                 ; restore the control word

	print "Nearest  : "
	print str$(r1)
	print chr$(13, 10)
	print "Truncated: "
	print str$(r2)
	print chr$(13, 10)
	exit
end start
