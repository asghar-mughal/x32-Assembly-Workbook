include includes\masm32rt.inc

say macro text:REQ
	print text, 13, 10
endm

showval macro caption:REQ, value:REQ
	print caption
	print str$(value)
	print chr$(13, 10)
endm

swapmem macro a:REQ, b:REQ
	push a
	push b
	pop a
	pop b
endm

maxof macro dest:REQ, a:REQ, b:REQ
	LOCAL finish
	mov eax, a
	cmp eax, b
	jge finish
	mov eax, b
finish:
	mov dest, eax
endm

.data
	x	sdword 25
	y	sdword -7
	big	sdword ?
.code
start:
	say "Macros in action"
	showval "x = ", x
	showval "y = ", y

	swapmem x, y
	showval "x after the swap = ", x

	maxof big, x, y
	showval "maximum = ", big
	maxof big, 3, 9
	showval "maximum of 3 and 9 = ", big
	exit
end start
