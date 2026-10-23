include includes\masm32rt.inc
.data
	result	dd ?
.code
add_two proc a:DWORD, b:DWORD
	mov eax, a                  ; the parameters have names
	add eax, b
	ret                         ; result in eax
add_two endp

start:
	invoke add_two, 7, 20
	mov result, eax             ; save it before print changes eax

	print "7 + 20 = "
	print str$(result)
	print chr$(13, 10)
	exit
end start
