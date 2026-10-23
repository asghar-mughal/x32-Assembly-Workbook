include includes\masm32rt.inc
.data
	depth	dd 0
.code
go_down proc
	inc depth
	invoke go_down              ; never stops
	ret
go_down endp

start:
	invoke go_down
	exit
end start
