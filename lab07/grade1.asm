include includes\masm32rt.inc
.data
	marks	dd 85
.code
start:
	mov eax, marks

	cmp eax, 90
	jge grade_a
	cmp eax, 80
	jge grade_b
	cmp eax, 70
	jge grade_c
	cmp eax, 60
	jge grade_d

	print "Grade F", 13, 10
	jmp done
grade_a:
	print "Grade A", 13, 10
	jmp done
grade_b:
	print "Grade B", 13, 10
	jmp done
grade_c:
	print "Grade C", 13, 10
	jmp done
grade_d:
	print "Grade D", 13, 10
done:
	exit
end start
