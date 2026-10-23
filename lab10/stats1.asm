include includes\masm32rt.inc
.data
	nums	dd 25, 7, 42, -3, 18, 31
	sum	dd ?
	avg	dd ?
	maxv	dd ?
	minv	dd ?
.code
start:
	; ---- sum ----
	mov eax, 0
	mov esi, 0
sum_loop:
	add eax, [nums+esi*4]
	inc esi
	cmp esi, LENGTHOF nums
	jl  sum_loop
	mov sum, eax

	; ---- average (whole number) ----
	cdq                         ; sign-extend eax into edx
	mov ebx, LENGTHOF nums
	idiv ebx
	mov avg, eax

	; ---- maximum and minimum ----
	mov eax, [nums]             ; maximum so far
	mov ebx, [nums]             ; minimum so far
	mov esi, 1                  ; start from the second element
mm_loop:
	cmp esi, LENGTHOF nums
	jge mm_done
	mov edx, [nums+esi*4]
	cmp edx, eax
	jle not_max
	mov eax, edx
not_max:
	cmp edx, ebx
	jge not_min
	mov ebx, edx
not_min:
	inc esi
	jmp mm_loop
mm_done:
	mov maxv, eax
	mov minv, ebx

	; ---- print ----
	print "Sum     = "
	print str$(sum)
	print chr$(13, 10)
	print "Average = "
	print str$(avg)
	print chr$(13, 10)
	print "Maximum = "
	print str$(maxv)
	print chr$(13, 10)
	print "Minimum = "
	print str$(minv)
	print chr$(13, 10)
	exit
end start
