include includes\masm32rt.inc
.data
	msg	db "assembly language", 0
	slen	dd ?
	cnt	dd ?
.code
start:
	; ---- length: count bytes until the zero ----
	mov esi, 0
len_loop:
	cmp byte ptr [msg+esi], 0
	je  len_done
	inc esi
	jmp len_loop
len_done:
	mov slen, esi

	; ---- count the letter a ----
	mov esi, 0
	mov edi, 0
cnt_loop:
	mov al, [msg+esi]
	cmp al, 0
	je  cnt_done
	cmp al, 'a'
	jne skip_a
	inc edi
skip_a:
	inc esi
	jmp cnt_loop
cnt_done:
	mov cnt, edi

	print offset msg
	print chr$(13, 10)
	print "Length = "
	print str$(slen)
	print chr$(13, 10)
	print "Letter a appears "
	print str$(cnt)
	print " times", 13, 10
	exit
end start
