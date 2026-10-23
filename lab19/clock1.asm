include includes\masm32rt.inc
option nokeyword:<st>
.data
	st	SYSTEMTIME <>
	colon	db ":", 0
.code
start:
	invoke GetLocalTime, addr st

	print "Date: "
	movzx eax, st.wYear
	print str$(eax)
	print "-"
	movzx eax, st.wMonth
	print str$(eax)
	print "-"
	movzx eax, st.wDay
	print str$(eax)
	print chr$(13, 10)

	print "Time: "
	movzx eax, st.wHour
	print str$(eax)
	print offset colon
	movzx eax, st.wMinute
	print str$(eax)
	print offset colon
	movzx eax, st.wSecond
	print str$(eax)
	print chr$(13, 10)
	exit
end start
