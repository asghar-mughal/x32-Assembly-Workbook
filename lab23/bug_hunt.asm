include includes\masm32rt.inc
.data?
	buf	db 16 dup(?)
.data
	nums	dd 5 dup(0)
	sum	dd 0
	avg	dd 0
	maxv	dd 0
.code
start:
	mov esi, 0
	mov ecx, 5
read_loop:
	print "Number: "
	invoke StdIn, addr buf, 15
	invoke atodw, addr buf
	mov [nums+esi], eax
	inc esi
	loop read_loop

	mov esi, 0
	mov eax, 0
sum_loop:
	add eax, [nums+esi*4]
	inc esi
	cmp esi, 5
	jl  sum_loop
	mov sum, eax

	mov ebx, 5
	div ebx
	mov avg, eax

	mov esi, 0
max_loop:
	mov eax, [nums+esi*4]
	cmp eax, maxv
	jbe skip_max
	mov eax, maxv
skip_max:
	inc esi
	cmp esi, 5
	jl  max_loop

	print "Sum     = "
	print str$(sum)
	print chr$(13, 10)
	print "Average = "
	print str$(avg)
	print chr$(13, 10)
	print "Maximum = "
	print str$(maxv)
	print chr$(13, 10)
	exit
end start
