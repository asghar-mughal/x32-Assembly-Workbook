include includes\masm32rt.inc
.data
	s1	db "apple", 0
	s2	db "apply", 0
	left	dd ?
	idx	dd ?
.code
start:
	cld
	mov esi, offset s1
	mov edi, offset s2
	mov ecx, SIZEOF s1              ; compare the zero byte too
	repe cmpsb
	mov left, ecx                   ; mov does not change the flags
	je  same                        ; ZF = 1: all bytes equal
	jb  less                        ; CF = 1: s1 is below s2
	print "s1 is greater than s2", 13, 10
	jmp where
less:
	print "s1 is less than s2", 13, 10
where:
	mov eax, SIZEOF s1
	sub eax, left
	dec eax
	mov idx, eax                    ; index of the first difference
	print "First difference at index "
	print str$(idx)
	print chr$(13, 10)
	jmp done
same:
	print "The strings are equal", 13, 10
done:
	exit
end start
