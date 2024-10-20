ORG 0x7c00
BITS 16

_start:
	cli
	xor ax, ax
	mov es, ax
	mov ds, ax
	mov ss, ax
	sti
	
	cli
	; enable A20 lined
	in al, 0x92
	or al, 2
	out 0x92, al

	; load gdt 
	lgdt [gdt]
	
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax

gdt_start:
; gdt null
gdt_null:
	dd 0x0
	dd 0x0
	
; 0x08
gdt_code: ; kernel code segment
	dw 0xffff ; segment len, bits 0-15
	dw 0x0 ; segment base, bits 0-15
	db 0x0 ; segment base, bits 16-23
	db 0x9a ; flags (8 bits)
	db 11001111b 
	db 0
; 0x10
gdt_data: ; kernel data segment
	dw 0xffff
	dw 0x0
	db 0x0
	db 0x92
	db 11001111b
	db 0
gdt_end:
gdt:
	dw gdt_end - gdt_start - 1
	dd gdt_start	

times 510-($-$$) db 0
dw 0xAA55 
