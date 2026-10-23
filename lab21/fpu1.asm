include includes\masm32rt.inc
.data
	a	real8 2.5
	b	real8 4.25
	sum	real8 ?
.code
include fpulib.inc
start:
	fld a                       ; st0 = 2.5
	fld b                       ; st0 = 4.25, st1 = 2.5
	faddp st(1), st             ; st1 = st1 + st0, then pop: st0 = 6.75
	fstp sum                    ; store the result and pop

	print "2.5 + 4.25 = "
	invoke print_real, addr sum, 2
	print chr$(13, 10)
	exit
end start
