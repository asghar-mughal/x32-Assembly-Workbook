include includes\masm32rt.inc
.data
	result	dd ?
.code
start:
	push 30                     ; third argument
	push 20                     ; second argument
	push 10                     ; first argument
	call sum3
	add esp, 12                 ; the caller removes the arguments
	mov result, eax

	print "10 + 20 + 30 = "
	print str$(result)
	print chr$(13, 10)
	exit

sum3:
	push ebp                    ; prologue
	mov ebp, esp
	sub esp, 4                  ; room for one local at [ebp-4]

	mov dword ptr [ebp-4], 0    ; total = 0
	mov eax, [ebp+8]            ; first argument
	add [ebp-4], eax
	mov eax, [ebp+12]           ; second argument
	add [ebp-4], eax
	mov eax, [ebp+16]           ; third argument
	add [ebp-4], eax
	mov eax, [ebp-4]            ; return the total in eax

	mov esp, ebp                ; epilogue
	pop ebp
	ret
end start
