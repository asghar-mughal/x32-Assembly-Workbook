include includes\masm32rt.inc
include mylib.inc
.data
	nums	sdword 25, 7, 42, -3, 18
	msg	db "assembly", 0
	n	sdword ?
.code
include mylibp.inc
start:
	say "Testing my library"
	invoke print_array, offset nums, LENGTHOF nums
	invoke strlen_p, offset msg
	mov n, eax
	showval "length = ", n
	maxof n, nums, nums+4
	showval "larger of the first two = ", n
	exit
end start
