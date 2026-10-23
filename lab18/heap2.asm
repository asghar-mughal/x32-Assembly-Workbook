include includes\masm32rt.inc
include mylib.inc

NAMELEN equ 16

STUDENT struct
	id		dd ?
	marks		dd ?
	sname		db NAMELEN dup(0)
STUDENT ends

.data?
	buf	db 32 dup(?)
.data
	hHeap	dd ?
	pClass	dd ?
	count	dd ?
	total	dd 0
	best	dd 0
.code
print_student proc uses esi pstu:DWORD
	mov esi, pstu
	mov eax, [esi+STUDENT.id]
	print str$(eax)
	print "  "
	lea eax, [esi+STUDENT.sname]
	invoke StdOut, eax
	print "  "
	mov eax, [esi+STUDENT.marks]
	print str$(eax)
	print chr$(13, 10)
	ret
print_student endp

start:
	invoke GetProcessHeap
	mov hHeap, eax

	print "How many students? "
	invoke StdIn, addr buf, 31
	invoke atodw, addr buf
	mov count, eax
	.if count == 0
		say "Nothing to do"
		exit
	.endif

	imul eax, count, SIZEOF STUDENT ; bytes needed
	invoke HeapAlloc, hHeap, HEAP_ZERO_MEMORY, eax
	.if eax == NULL
		say "Out of memory"
		exit
	.endif
	mov pClass, eax

	; ---- read the records ----
	mov esi, pClass
	mov ebx, 1
	.while ebx <= count
		mov [esi+STUDENT.id], ebx
		print "Name : "
		lea eax, [esi+STUDENT.sname]
		invoke StdIn, eax, NAMELEN - 1
		print "Marks: "
		invoke StdIn, addr buf, 31
		invoke atodw, addr buf
		mov [esi+STUDENT.marks], eax
		add esi, SIZEOF STUDENT
		inc ebx
	.endw

	; ---- report ----
	print chr$(13, 10)
	mov esi, pClass
	xor ebx, ebx
	xor edi, edi                    ; total marks
	.while ebx < count
		invoke print_student, esi
		add edi, [esi+STUDENT.marks]
		add esi, SIZEOF STUDENT
		inc ebx
	.endw
	mov total, edi

	mov eax, total
	xor edx, edx
	div count
	mov best, eax                   ; the average
	showval "Average = ", best

	invoke HeapFree, hHeap, 0, pClass
	mov pClass, 0
	exit
end start
