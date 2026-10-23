include includes\masm32rt.inc
.data
	result	dd ?
	calls	dd 0                    ; counts the calls
.code
fact proc n:DWORD
	inc calls                   ; one more call
	mov eax, n
	cmp eax, 1
	jbe fact_base               ; base case: n is 0 or 1
	dec eax                     ; n - 1
	invoke fact, eax            ; eax = fact(n - 1)
	mul n                       ; eax = fact(n - 1) * n
	ret
fact_base:
	mov eax, 1                  ; 0! = 1! = 1
	ret
fact endp

start:
	invoke fact, 5
	mov result, eax

	print "5! = "
	print str$(result)
	print chr$(32, 40)
	print str$(calls)
	print " calls", 41, 13, 10
	exit
end start
