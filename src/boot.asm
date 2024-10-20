ORG 0x7c00
BITS 16

_start:
	mov ah, 0eh
	mov al, 'B'
	mov bh, 0
	mov bl, 13
	int 0x10
	jmp $

times 510-($-$$) db 0
dw 0xAA55 
