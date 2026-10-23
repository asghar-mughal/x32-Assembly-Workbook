include includes\masm32rt.inc
.code
start:
	mov al, 200
	add al, 100             ; test 1

	mov al, 100
	add al, 100             ; test 2

	mov al, 0FFh
	add al, 1               ; test 3

	mov al, 7Fh
	inc al                  ; test 4

	mov ax, 0FFFFh
	add ax, 1               ; test 5

	mov al, 5
	sub al, 10              ; test 6

	exit
end start
