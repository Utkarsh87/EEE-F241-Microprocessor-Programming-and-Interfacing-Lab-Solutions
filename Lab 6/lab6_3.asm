.model tiny
.486
.data
buff db 80 dup(?), '$'
file db 'FileOp.txt', 0
count equ 80
handle dw ?

.code
.startup
	mov ah, 3dh;	open file
	lea dx, file
	mov al, 00;		read only mode
	int 21h
	mov handle, ax

	mov ah, 3fh;	read file
	mov bx, handle
	mov cx, count
	lea dx, buff
	int 21h

	mov ah, 09h;	display $ terminated string
	lea dx, buff
	int 21h

	mov ah, 3eh
	mov bx, handle
	int 21h
.exit
end


