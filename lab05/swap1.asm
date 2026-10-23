include includes\masm32rt.inc
.code
start:
	mov eax, 12345678h
	xchg al, ah             ; swap two registers' contents

	mov eax, 12345678h
	bswap eax               ; reverse the byte order of all 32 bits

	exit
end start
