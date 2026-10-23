include includes\masm32rt.inc
.data
	num	dd 17
.code
start:
	test num, 1             ; look at bit 0 only
	jz   is_even
	print "Odd", 13, 10
	jmp done
is_even:
	print "Even", 13, 10
done:
	exit
end start
