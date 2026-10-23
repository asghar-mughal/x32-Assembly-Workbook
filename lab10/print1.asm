include includes\masm32rt.inc
.data
	scores	dd 10, 20, 30, 40, 50
.code
start:
	mov esi, 0                  ; index
print_loop:
	mov eax, [scores+esi*4]     ; element number esi
	print str$(eax)
	print " "
	inc esi
	cmp esi, LENGTHOF scores
	jl  print_loop
	print chr$(13, 10)
	exit
end start
