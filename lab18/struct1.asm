include includes\masm32rt.inc

NAMELEN equ 16

STUDENT struct
	id		dd ?
	marks		dd ?
	sname		db NAMELEN dup(0)
STUDENT ends

.data
	s1	STUDENT <>
	nm1	db "Ali", 0
.code
start:
	mov s1.id, 101
	mov s1.marks, 85
	invoke lstrcpyn, addr s1.sname, offset nm1, NAMELEN

	print "ID    : "
	print str$(s1.id)
	print chr$(13, 10)
	print "Name  : "
	print offset s1.sname
	print chr$(13, 10)
	print "Marks : "
	print str$(s1.marks)
	print chr$(13, 10)
	exit
end start
