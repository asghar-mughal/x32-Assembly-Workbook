include includes\masm32rt.inc

NAMELEN equ 16

STUDENT struct
	id		dd ?
	marks		dd ?
	sname		db NAMELEN dup(0)
STUDENT ends

.data
	class1	STUDENT 3 dup(<>)
	n1	db "Ali", 0
	n2	db "Sara", 0
	n3	db "Omar", 0
	total	dd ?
	avg	dd ?
.code
set_student proc uses esi pstu:DWORD, sid:DWORD, smarks:DWORD, pname:DWORD
	mov esi, pstu
	mov eax, sid
	mov [esi+STUDENT.id], eax
	mov eax, smarks
	mov [esi+STUDENT.marks], eax
	lea eax, [esi+STUDENT.sname]
	invoke lstrcpyn, eax, pname, NAMELEN
	ret
set_student endp

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
	invoke set_student, offset class1, 101, 85, offset n1
	invoke set_student, offset class1 + SIZEOF STUDENT, 102, 92, offset n2
	invoke set_student, offset class1 + 2 * SIZEOF STUDENT, 103, 67, offset n3

	mov esi, offset class1
	mov ebx, LENGTHOF class1
	xor edi, edi                    ; total marks
	.while ebx > 0
		invoke print_student, esi
		add edi, [esi+STUDENT.marks]
		add esi, SIZEOF STUDENT     ; next record
		dec ebx
	.endw
	mov total, edi

	mov eax, total
	xor edx, edx
	mov ecx, LENGTHOF class1
	div ecx
	mov avg, eax

	print "Average = "
	print str$(avg)
	print chr$(13, 10)
	exit
end start
