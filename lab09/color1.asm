include includes\masm32rt.inc
.data
	color	dd 336699h
	red	dd ?
	green	dd ?
	blue	dd ?
	rgb	dd ?
.code
start:
	; ---- unpack ----
	mov eax, color
	shr eax, 16             ; move the red byte to the bottom
	and eax, 0FFh           ; keep only the low 8 bits
	mov red, eax

	mov eax, color
	shr eax, 8              ; move the green byte to the bottom
	and eax, 0FFh
	mov green, eax

	mov eax, color
	and eax, 0FFh           ; the blue byte is already at the bottom
	mov blue, eax

	; ---- pack again ----
	mov eax, red
	shl eax, 16
	mov ebx, green
	shl ebx, 8
	or  eax, ebx
	or  eax, blue
	mov rgb, eax

	print "Red   = "
	print str$(red)
	print chr$(13, 10)
	print "Green = "
	print str$(green)
	print chr$(13, 10)
	print "Blue  = "
	print str$(blue)
	print chr$(13, 10)
	print "Packed = "
	print hex$(rgb)
	print chr$(13, 10)
	exit
end start
