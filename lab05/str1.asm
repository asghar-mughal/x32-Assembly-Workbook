include includes\masm32rt.inc
.data
	word1	db "abc", 0
.code
start:
	mov eax, 0
	mov al, word1           ; first character
	mov bl, word1+1         ; second character
	mov cl, word1+2         ; third character

	print offset word1
	print chr$(13, 10)

	sub word1, 20h          ; change 'a' to 'A'
	sub word1+1, 20h
	sub word1+2, 20h

	print offset word1
	print chr$(13, 10)

	exit
end start
