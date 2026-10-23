include includes\masm32rt.inc
include mylib.inc                  ; my macros (Lab 17)

.data
	choice	dd 0
.code
include mylibp.inc                 ; my procedures (Lab 17)

show_menu proc
	print "======== My Project ========", 13, 10
	print " 1. First feature", 13, 10
	print " 2. Second feature", 13, 10
	print " 3. Third feature", 13, 10
	print " 0. Exit", 13, 10
	print "Choice: "
	ret
show_menu endp

read_number proc                    ; returns the number in EAX
	LOCAL buf[16]:BYTE
	invoke StdIn, addr buf, 15
	invoke atodw, addr buf
	ret
read_number endp

read_range proc uses ebx lo:DWORD, hi:DWORD
rr_again:
	invoke read_number
	mov ebx, eax
	.if (ebx >= lo) && (ebx <= hi)
		mov eax, ebx
		ret
	.endif
	print "Invalid, please enter a number from "
	print str$(lo)
	print " to "
	print str$(hi)
	print ": "
	jmp rr_again
read_range endp

feature1 proc
	say "Feature 1 is not written yet"      ; a stub: replace it later
	ret
feature1 endp

feature2 proc
	say "Feature 2 is not written yet"
	ret
feature2 endp

feature3 proc
	say "Feature 3 is not written yet"
	ret
feature3 endp

start:
	.repeat
		invoke show_menu
		invoke read_range, 0, 3
		mov choice, eax
		.if choice == 1
			invoke feature1
		.elseif choice == 2
			invoke feature2
		.elseif choice == 3
			invoke feature3
		.endif
	.until choice == 0
	say "Goodbye"
	exit
end start
