extern ft_strlen

section .text
	global ft_strcpy

ft_strcpy:
	xor rax, rax	
	mov rcx, rdi
	mov rdi, rsi
	call ft_strlen
	mov rdi, rcx
	xor rcx, rcx

.loop:
	cmp rcx, rax
	je .done
	mov dl, byte [rsi + rcx]
	mov byte [rdi + rcx], dl 
	inc	rcx 
	jmp .loop

.done:
	mov byte [rdi + rcx], 0
	mov rax, rdi
	ret
