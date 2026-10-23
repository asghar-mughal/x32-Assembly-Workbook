include includes\masm32rt.inc
.data
	msg	db "assembly language", 0
	len1	dd ?
	len2	dd ?
.code
start:
	; ---- method 1: a loop (Lab 10) ----
	mov esi, 0
len_loop:
	cmp byte ptr [msg+esi], 0
	je  len_done
	inc esi
	jmp len_loop
len_done:
	mov len1, esi

	; ---- method 2: repne scasb ----
	cld
	mov edi, offset msg         ; where to search
	xor al, al                  ; look for the zero byte
	mov ecx, -1                 ; a very large count (0FFFFFFFFh)
	repne scasb                 ; repeat while [edi] is not al
	not ecx                     ; turn the count into the length + 1
	dec ecx                     ; the length
	mov len2, ecx

	print "Method 1 = "
	print str$(len1)
	print chr$(13, 10)
	print "Method 2 = "
	print str$(len2)
	print chr$(13, 10)
	exit
end start
