include includes\masm32rt.inc
.data
	msg	db "assembly, 2nd edition", 0
.code
start:
	cld
	mov esi, offset msg             ; read from here
	mov edi, offset msg             ; write back to the same place
up_loop:
	lodsb
	test al, al
	jz  up_done
	cmp al, 'a'
	jb  up_store                    ; below 'a': not a lower case letter
	cmp al, 'z'
	ja  up_store                    ; above 'z': not a lower case letter
	sub al, 20h                     ; convert to upper case
up_store:
	stosb
	jmp up_loop
up_done:
	print offset msg
	print chr$(13, 10)
	exit
end start
