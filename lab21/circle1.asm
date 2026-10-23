include includes\masm32rt.inc
.data
	r	real8 2.5
	two	real8 2.0
	area	real8 ?
	circ	real8 ?
.code
include fpulib.inc
start:
	fld r
	fmul st(0), st(0)           ; st0 = r * r
	fldpi                       ; st0 = pi, st1 = r * r
	fmulp st(1), st             ; st0 = pi * r * r
	fstp area

	fld r
	fmul two                    ; 2 * r
	fldpi
	fmulp st(1), st             ; 2 * pi * r
	fstp circ

	print "Area          = "
	invoke print_real, addr area, 2
	print chr$(13, 10)
	print "Circumference = "
	invoke print_real, addr circ, 2
	print chr$(13, 10)
	exit
end start
