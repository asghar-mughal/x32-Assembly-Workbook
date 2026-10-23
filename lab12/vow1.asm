include includes\masm32rt.inc
.data
	msg	db "Assembly Language Is Fun", 0
	vowels	dd 0
	words	dd 0
.code
start:
	cld
	mov esi, offset msg
	mov edi, 0                      ; number of vowels
	mov ebx, 0                      ; number of words
	mov dl, 1                       ; 1 = we are between words
count_loop:
	lodsb
	test al, al
	jz  count_done
	cmp al, ' '
	jne not_space
	mov dl, 1                       ; a space: between words
	jmp count_loop
not_space:
	cmp dl, 1
	jne same_word
	inc ebx                         ; first letter of a new word
	mov dl, 0
same_word:
	or  al, 20h                     ; to lower case
	cmp al, 'a'
	je  is_vowel
	cmp al, 'e'
	je  is_vowel
	cmp al, 'i'
	je  is_vowel
	cmp al, 'o'
	je  is_vowel
	cmp al, 'u'
	jne count_loop
is_vowel:
	inc edi
	jmp count_loop
count_done:
	mov vowels, edi
	mov words, ebx

	print "Vowels = "
	print str$(vowels)
	print chr$(13, 10)
	print "Words  = "
	print str$(words)
	print chr$(13, 10)
	exit
end start
