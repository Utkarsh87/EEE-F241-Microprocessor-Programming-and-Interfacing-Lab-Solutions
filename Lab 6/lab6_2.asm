.model tiny
.486
.data
dat1 db 'Krishna Bhawan', 0DH, 0AH, '4154', 0DH, 0AH, '$'
handle dw ?
count equ 22
file db 'FileOp.txt', 0

.code
.startup
	mov ah, 3dh;	open file
	mov al, 02
	lea dx, file
	int 21h
	mov handle, ax

	mov ah, 42h;	move file ptr
	mov al, 02;		move technique
	mov bx, handle
	xor cx, cx
	xor dx, dx
	int 21h

	mov ah, 40h;	write into file
	mov bx, handle
	mov cx, count
	lea dx, dat1
	int 21h


	mov ah, 3eh;	close file
	mov bx, handle
	int 21h
.exit
end
