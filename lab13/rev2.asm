include includes\masm32rt.inc
.data
	text	db "stack", 0
	out1	db 16 dup(0)
.code
start:
	; ---- push every character ----
	mov esi, offset text
	mov ebx, 0                  ; number of characters pushed
push_loop:
	movzx eax, byte ptr [esi]
	test eax, eax
	jz  push_done
	push eax                    ; push the character as a doubleword
	inc esi
	inc ebx
	jmp push_loop
push_done:

	; ---- pop them into out1 ----
	mov edi, offset out1
pop_loop:
	test ebx, ebx
	jz  pop_done
	pop eax
	mov [edi], al               ; the character is the low byte
	inc edi
	dec ebx
	jmp pop_loop
pop_done:
	mov byte ptr [edi], 0       ; end of string

	print offset out1
	print chr$(13, 10)
	exit
end start
