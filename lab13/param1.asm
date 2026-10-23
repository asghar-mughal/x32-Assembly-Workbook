include includes\masm32rt.inc
.data
	result	dd ?
.code
start:
	push 20                     ; second parameter
	push 7                      ; first parameter
	call add2
	add esp, 8                  ; the caller removes the 2 parameters
	mov result, eax

	print "7 + 20 = "
	print str$(result)
	print chr$(13, 10)
	exit

add2:
	mov eax, [esp+4]            ; first parameter
	add eax, [esp+8]            ; second parameter
	ret
end start
