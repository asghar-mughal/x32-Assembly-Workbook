; fpulib.inc: print a real8 number with a fixed number of decimals
IFNDEF FPULIB_INC
FPULIB_INC equ 1

.data
	scales	dd 10, 100, 1000, 10000
	fmts	dd offset f1, offset f2, offset f3, offset f4
	f1	db "%s%d.%01d", 0
	f2	db "%s%d.%02d", 0
	f3	db "%s%d.%03d", 0
	f4	db "%s%d.%04d", 0
	minus	db "-", 0
	empty	db 0
.code
print_real proc uses ebx esi pval:DWORD, decs:DWORD
	LOCAL n:SDWORD
	LOCAL buf[40]:BYTE
	mov esi, decs
	dec esi                         ; table index 0 to 3
	mov eax, pval
	fld real8 ptr [eax]             ; st0 = value
	fild dword ptr [scales+esi*4]   ; st0 = scale, st1 = value
	fmulp st(1), st                 ; st0 = value * scale
	fistp n                         ; n = round(value * scale), the stack is empty

	mov ebx, offset empty
	mov eax, n
	.if sdword ptr eax < 0
		neg eax
		mov ebx, offset minus
	.endif
	xor edx, edx
	mov ecx, [scales+esi*4]
	div ecx                         ; eax = integer part, edx = decimals
	mov ecx, [fmts+esi*4]
	invoke wsprintf, addr buf, ecx, ebx, eax, edx
	invoke StdOut, addr buf
	ret
print_real endp

ENDIF
