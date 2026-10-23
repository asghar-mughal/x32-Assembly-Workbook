include includes\masm32rt.inc
.data
	v1	dd -1
	v2	dd 1
.code
start:
	mov eax, v1
	cmp eax, v2
	jl  signed_less
	print "signed:   -1 is NOT less than 1", 13, 10
	jmp check_unsigned
signed_less:
	print "signed:   -1 is less than 1", 13, 10

check_unsigned:
	mov eax, v1
	cmp eax, v2
	jb  unsigned_less
	print "unsigned: FFFFFFFFh is NOT below 1", 13, 10
	jmp done
unsigned_less:
	print "unsigned: FFFFFFFFh is below 1", 13, 10

done:
	exit
end start
