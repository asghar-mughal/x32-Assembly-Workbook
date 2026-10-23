include includes\masm32rt.inc
.data
	num	dd 7
.code
start:
	cmp num, 0
	je  is_zero
	jl  is_negative

	print "The number is positive", 13, 10
	jmp done

is_negative:
	print "The number is negative", 13, 10
	jmp done

is_zero:
	print "The number is zero", 13, 10

done:
	exit
end start
