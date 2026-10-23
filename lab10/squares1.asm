include includes\masm32rt.inc
.data
	squares	dd 10 dup(0)
.code
start:
	mov esi, 0
fill_loop:
	mov eax, esi
	inc eax                     ; eax = index + 1
	mul eax                     ; eax = eax * eax
	mov [squares+esi*4], eax    ; store into the array
	inc esi
	cmp esi, LENGTHOF squares
	jl  fill_loop

	mov esi, 0
show_loop:
	mov eax, [squares+esi*4]
	print str$(eax)
	print " "
	inc esi
	cmp esi, LENGTHOF squares
	jl  show_loop
	print chr$(13, 10)
	exit
end start
