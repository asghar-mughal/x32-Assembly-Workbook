include includes\masm32rt.inc
.data
	title1	db "Lab 19", 0
	text1	db "Hello from the Windows API!", 0
.code
start:
	invoke MessageBox, NULL, addr text1, addr title1, MB_OK
	exit
end start
