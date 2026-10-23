include includes\masm32rt.inc
.data?
	buf	db 64 dup(?)
	buf2	db 64 dup(?)
.data
	slen	dd 0
.code
start:
	print "Enter a word: "
	invoke StdIn, addr buf, 63
	cld

	; ---- length ----
	mov edi, offset buf
	xor al, al
	mov ecx, -1
	repne scasb
	not ecx
	dec ecx
	mov slen, ecx

	; ---- copy to buf2, including the zero ----
	mov esi, offset buf
	mov edi, offset buf2
	mov ecx, slen
	inc ecx
	rep movsb

	; ---- reverse buf2 in place ----
	mov esi, offset buf2            ; left pointer
	mov edi, offset buf2
	add edi, slen
	dec edi                         ; right pointer: the last character
rev_loop:
	cmp esi, edi
	jae rev_done                    ; pointers met: finished
	mov al, [esi]
	mov bl, [edi]
	mov [esi], bl
	mov [edi], al
	inc esi
	dec edi
	jmp rev_loop
rev_done:

	print "Length   : "
	print str$(slen)
	print chr$(13, 10)
	print "Reversed : "
	print offset buf2
	print chr$(13, 10)

	; ---- palindrome test: compare buf and buf2 ----
	mov esi, offset buf
	mov edi, offset buf2
	mov ecx, slen
	inc ecx                         ; include the zero byte
	repe cmpsb
	jne not_pal
	print "Palindrome", 13, 10
	jmp done
not_pal:
	print "Not a palindrome", 13, 10
done:
	exit
end start
