include includes\masm32rt.inc
.data
	a01	real8 0.1
	b02	real8 0.2
	c03	real8 0.3
	eps	real8 1.0e-9
.code
start:
	fld c03                     ; st0 = 0.3
	fld a01                     ; st0 = 0.1, st1 = 0.3
	fadd b02                    ; st0 = 0.1 + 0.2
	fcompp                      ; compare st0 with st1, pop both
	fnstsw ax                   ; the FPU status word to ax
	sahf                        ; and into the CPU flags
	je  equal
	ja  greater
	print "0.1 + 0.2 is less than 0.3", 13, 10
	exit
equal:
	print "0.1 + 0.2 equals 0.3", 13, 10
	exit
greater:
	print "0.1 + 0.2 is greater than 0.3", 13, 10
	exit
end start
