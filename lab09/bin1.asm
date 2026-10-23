include includes\masm32rt.inc
.data
	value	dd 0A5h
.code
start:
	mov ebx, value          ; EBX is kept safe from print
	mov esi, 32             ; 32 bits to print
bit_loop:
	rol ebx, 1              ; CF = the top bit
	jc  one
	print "0"
	jmp next_bit
one:
	print "1"
next_bit:
	dec esi
	jnz bit_loop

	print chr$(13, 10)
	exit
end start
