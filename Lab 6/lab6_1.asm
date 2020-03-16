.model tiny 
.486
.data
dat1 db 'Utkarsh Kumar 2018A3PS0368P', 0DH, 0AH, 'Utkarsh Kumar 2018A3PS0368P', 0DH, 0AH, '$'
count equ 58
handle dw ?
file db 'FileOp.txt', 0

.code
.startup
	mov ah, 3ch;	create file
	lea dx, file
	mov cl, 01h; set attribute byte
	int 21h
	mov handle, ax; store handle of the created file into namesake memory location
	
	mov ah, 3dh;	open file
	mov al, 02;		in r/w mode
	lea dx, file
	int 21h
	mov handle, ax

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


