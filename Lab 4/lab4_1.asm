.model tiny
.486

.data
dat1 db 'math','have','    ','bury','mine','dine','    ','hell','deep','tree'
cnt1 db 10

.code
.startup
	lea di, dat1
	movzx cx, cnt1
	mov eax, '    '
	repne scasd; compares es:di with eax
	mov si, di
l1:	lodsd; loads ds:si into eax
	cmp eax, '    '
	jz l2
	bswap eax; bswap reverses the order of a 32-bit register
	stosd; loads es:di with eax
	loop l1
l2:	nop
.exit
end
