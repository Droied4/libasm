section .text
	global ft_strcpy
	extern __errno_location
	extern malloc

ft_strdup:
	xor rax, rax
	call ft_strlen
	xor rcx, rcx

	;i need to call malloc and handle errno
	;in case memory dont have memory :D
	

.loop:
	cmp rcx, rax
	je .done
	mov dl, byte [mivariabledemallocepicaxd+ rcx] ; dl es la temporal para mover byte a byte
	mov byte [mivariabledemallocepicaxd + rcx], dl 
	inc	rcx 
	jmp .loop

	;luego hacer el handle de todo

.done:
	mov byte [rdi + rcx], 0
	mov rax, rdi
	ret
