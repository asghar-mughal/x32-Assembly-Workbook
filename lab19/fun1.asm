include includes\masm32rt.inc
.data
	hOut	dd ?
.code
start:
	invoke GetStdHandle, STD_OUTPUT_HANDLE
	mov hOut, eax

	invoke SetConsoleTitle, chr$("Lab 19: the Windows API")

	invoke SetConsoleTextAttribute, hOut, 0Ch     ; bright red
	print "Red text", 13, 10
	invoke SetConsoleTextAttribute, hOut, 0Ah     ; bright green
	print "Green text", 13, 10
	invoke SetConsoleTextAttribute, hOut, 1Fh     ; white on blue
	print "White on blue", 13, 10
	invoke SetConsoleTextAttribute, hOut, 07h     ; the normal colors

	; ---- put the cursor at column 10, row 8 ----
	mov eax, 8                      ; row (Y)
	shl eax, 16
	or  eax, 10                     ; column (X) in the low word
	invoke SetConsoleCursorPosition, hOut, eax
	print "Here"

	invoke Beep, 800, 300           ; 800 Hz for 300 ms
	invoke Sleep, 500               ; wait half a second
	invoke Beep, 400, 300

	print chr$(13, 10)
	exit
end start
