include includes\masm32rt.inc
.data
	num	sdword -5
.code
start:
	.if num > 0
		print "positive", 13, 10
	.elseif num < 0
		print "negative", 13, 10
	.else
		print "zero", 13, 10
	.endif
	exit
end start
