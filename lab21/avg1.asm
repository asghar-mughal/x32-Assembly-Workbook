include includes\masm32rt.inc
.data
	x1	real8 85.0
	x2	real8 92.5
	x3	real8 67.25
	count	sdword 3
	avg	real8 ?
.code
include fpulib.inc
start:
	fld x1
	fadd x2
	fadd x3                     ; st0 = the sum
	fidiv count                 ; st0 = the sum / the integer 3
	fstp avg

	print "Average = "
	invoke print_real, addr avg, 2
	print chr$(13, 10)
	print "Average = "
	invoke print_real, addr avg, 4
	print chr$(13, 10)
	exit
end start
