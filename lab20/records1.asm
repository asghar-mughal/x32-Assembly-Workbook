include includes\masm32rt.inc

NAMELEN equ 16

STUDENT struct
	id		dd ?
	marks		dd ?
	sname		db NAMELEN dup(0)
STUDENT ends

.data
	class1	STUDENT 3 dup(<>)
	class2	STUDENT 3 dup(<>)
	dbfile	db "C:\asmlab\lab20\class.dat", 0
	n1	db "Ali", 0
	n2	db "Sara", 0
	n3	db "Omar", 0
	hFile	dd ?
	nbytes	dd ?
.code
set_student proc uses esi edi pstu:DWORD, the_id:DWORD, the_marks:DWORD, pname:DWORD
	mov esi, pstu
	mov eax, the_id
	mov [esi+STUDENT.id], eax
	mov eax, the_marks
	mov [esi+STUDENT.marks], eax

	mov esi, pname
	mov edi, pstu
	add edi, STUDENT.sname
	cld
copy_name:
	lodsb
	stosb
	test al, al
	jnz copy_name
	ret
set_student endp

print_student proc uses esi pstu:DWORD
	mov esi, pstu
	print "ID    : "
	mov eax, [esi+STUDENT.id]
	print str$(eax)
	print chr$(13, 10)
	print "Name  : "
	lea eax, [esi+STUDENT.sname]
	invoke StdOut, eax
	print chr$(13, 10)
	print "Marks : "
	mov eax, [esi+STUDENT.marks]
	print str$(eax)
	print chr$(13, 10, 13, 10)
	ret
print_student endp

save_class proc
	invoke CreateFile, addr dbfile, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
	mov hFile, eax
	.if hFile == INVALID_HANDLE_VALUE
		xor eax, eax                ; 0 = failed
		ret
	.endif
	invoke WriteFile, hFile, offset class1, SIZEOF class1, addr nbytes, NULL
	invoke CloseHandle, hFile
	mov eax, nbytes                 ; the number of bytes saved
	ret
save_class endp

load_class proc
	invoke CreateFile, addr dbfile, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
	mov hFile, eax
	.if hFile == INVALID_HANDLE_VALUE
		xor eax, eax
		ret
	.endif
	invoke ReadFile, hFile, offset class2, SIZEOF class2, addr nbytes, NULL
	invoke CloseHandle, hFile
	mov eax, nbytes
	ret
load_class endp

start:
	invoke set_student, offset class1, 101, 85, offset n1
	invoke set_student, offset class1 + SIZEOF STUDENT, 102, 92, offset n2
	invoke set_student, offset class1 + 2 * SIZEOF STUDENT, 103, 67, offset n3

	invoke save_class
	print "Saved bytes: "
	print str$(eax)
	print chr$(13, 10)

	invoke load_class
	print "Loaded bytes: "
	print str$(eax)
	print chr$(13, 10)

	mov esi, offset class2
	mov ebx, 3
	.while ebx > 0
		invoke print_student, esi
		add esi, SIZEOF STUDENT
		dec ebx
	.endw
	exit
end start
