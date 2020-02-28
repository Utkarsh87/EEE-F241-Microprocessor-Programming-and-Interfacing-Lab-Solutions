.model tiny
.486

.data
enter_name db 'Enter User Name',0ah,0dh,'$'
enter_passwd db 'Enter Password',0ah,0dh,'$'
hello db 'Hello $'
username db 'Shiva$'
passwd db 'shiva123$'
pass_entered db 32
pass_entered_act db ?
pass_entered_inp db 32 dup(0)
usnm_entered db 32
usnm_entered_act db ?
usnm_entered_inp db 32 dup(0)

.code
.startup
	lea dx,enter_name
	mov ah, 09h
	int 21h
	lea dx, usnm_entered
	mov ah, 0ah
	int 21h
	lea si, username
	lea di, usnm_entered+2
	mov cl, 05
	
	;Username Comparison
l1:	mov al, [di]
	cmp [si], al
	jne exit
	inc si
	inc di
	dec cl
	jnz l1

	lea dx, enter_passwd
	mov ah, 09h
	int 21h
	lea dx, pass_entered
	mov ah, 0ah
	int 21h
	lea si, passwd
	lea di, pass_entered+2
	mov cl, 08

	;Password Comparison
l2:	mov al, [di]
	cmp [si], al
	jne exit
	inc si
	inc di
	dec cl
	jnz l2

	lea dx, hello
	mov ah, 09h
	int 21h
	lea dx, username
	mov ah, 09h
	int 21h

exit:
.exit
end