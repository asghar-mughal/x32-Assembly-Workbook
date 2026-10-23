include includes\masm32rt.inc
.data
	result	dd ?
	calls	dd 0
.code
fib proc n:DWORD
	LOCAL first:DWORD           ; keeps fib(n-1) while the second call runs
	inc calls
	mov eax, n
	cmp eax, 2
	jb  fib_base                ; fib(0) = 0 and fib(1) = 1: return n
	dec eax
	invoke fib, eax             ; fib(n - 1)
	mov first, eax              ; save it in the local variable
	mov eax, n
	sub eax, 2
	invoke fib, eax             ; fib(n - 2)
	add eax, first
	ret
fib_base:
	ret                         ; eax already holds n
fib endp

start:
	invoke fib, 10
	mov result, eax

	print "fib", 40, "10", 41, " = "
	print str$(result)
	print chr$(32, 40)
	print str$(calls)
	print " calls", 41, 13, 10
	exit
end start
