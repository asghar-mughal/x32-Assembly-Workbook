include includes\masm32rt.inc
.data
	msg	db "abc", 0
	res	dd ?
.code

; Function F1: max of two signed numbers (stdcall, 2 params)
F1:
	push ebp
	mov ebp, esp
	mov eax, dword ptr [ebp+8]
	cmp eax, dword ptr [ebp+0Ch]
	jge F1_L1
	mov eax, dword ptr [ebp+0Ch]
F1_L1:
	pop ebp
	ret 8

; Function F2: sum 1 + 2 + ... + n (stdcall, 1 param)
F2:
	push ebp
	mov ebp, esp
	xor eax, eax
	mov ecx, dword ptr [ebp+8]
	test ecx, ecx
	je F2_L2
F2_L1:
	add eax, ecx
	dec ecx
	jne F2_L1
F2_L2:
	pop ebp
	ret 4

; Function F3: string length (stdcall, 1 param)
F3:
	push edi
	mov edi, dword ptr [esp+8]
	xor eax, eax
	mov ecx, 0FFFFFFFFh
	cld
	repne scasb
	not ecx
	dec ecx
	mov eax, ecx
	pop edi
	ret 4

; Function F4: multiply by 10 (cdecl, 1 param)
F4:
	mov eax, dword ptr [esp+4]
	lea eax, dword ptr [eax+eax*4]
	add eax, eax
	ret

; Function F5: count set bits / popcount (stdcall, 1 param)
F5:
	mov edx, dword ptr [esp+4]
	xor eax, eax
F5_L1:
	test edx, edx
	je F5_L2
	mov ecx, edx
	and ecx, 1
	add eax, ecx
	shr edx, 1
	jmp F5_L1
F5_L2:
	ret 4

; Function F6: recursive factorial (stdcall, 1 param)
F6:
	push ebp
	mov ebp, esp
	mov eax, dword ptr [ebp+8]
	cmp eax, 1
	jbe F6_L1
	dec eax
	push eax
	call F6
	imul eax, dword ptr [ebp+8]
	jmp F6_L2
F6_L1:
	mov eax, 1
F6_L2:
	pop ebp
	ret 4

start:
	push 25
	push 7
	call F1
	mov res, eax
	print "F1, 7, 25 = "
	print str$(res)
	print chr$(13, 10)

	push 4
	call F2
	mov res, eax
	print "F2, 4     = "
	print str$(res)
	print chr$(13, 10)

	push offset msg
	call F3
	mov res, eax
	print "F3, abc   = "
	print str$(res)
	print chr$(13, 10)

	push 7
	call F4
	add esp, 4
	mov res, eax
	print "F4, 7     = "
	print str$(res)
	print chr$(13, 10)

	push 0Fh
	call F5
	mov res, eax
	print "F5, 0Fh   = "
	print str$(res)
	print chr$(13, 10)

	push 5
	call F6
	mov res, eax
	print "F6, 5     = "
	print str$(res)
	print chr$(13, 10)

	exit
end start
