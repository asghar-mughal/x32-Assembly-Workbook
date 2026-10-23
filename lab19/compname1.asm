include includes\masm32rt.inc
.data?
	cname	db 32 dup(?)
.data
	csize	dd 32
.code
start:
	invoke GetComputerName, addr cname, addr csize
	print "Computer: "
	print offset cname
	print chr$(13, 10)
	print "Length  : "
	print str$(csize)
	print chr$(13, 10)
	exit
end start
