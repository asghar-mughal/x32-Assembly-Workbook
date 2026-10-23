include includes\masm32rt.inc
.data
	marks	dd 85
.code
start:
	mov eax, marks
	cmp eax, 0
	jl  invalid             ; below 0: invalid
	cmp eax, 100
	jg  invalid             ; above 100: invalid

	print "Valid mark", 13, 10
	jmp done
invalid:
	print "Invalid mark", 13, 10
done:
	exit
end start
