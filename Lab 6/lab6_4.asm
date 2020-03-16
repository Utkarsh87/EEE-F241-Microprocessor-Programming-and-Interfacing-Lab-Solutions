.model tiny
.486
.data
buff db 100 dup(?), '$'
count equ 1
handle dw ?
file db 'FileOp.txt', 0

.code
.startup
	mov ah, 3dh;	open file
	lea dx, file
	mov al, 00;		read only mode
	int 21h
	mov handle, ax

	lea di, buff

l1:	mov ah, 3fh;	read file
	mov bx, handle
	mov cx, count
	mov dx, di
	int 21h

	inc di
	cmp ax, 0000h;	ax stores the number of bytes read in each read operation
	jne l1

	mov byte ptr[di], 0DH
	inc di
	mov byte ptr[di], 0AH
	inc di
	mov byte ptr[di], '$'

	lea dx, buff
	mov ah, 09h
	int 21h

	mov ah, 3eh
	mov bx, handle
	int 21h
.exit
end