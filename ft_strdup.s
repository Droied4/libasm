section .text
	global ft_strdup
	extern __errno_location
	extern malloc
	extern	ft_strlen 

ft_strdup:
	push rbx; we save rbx value
	call ft_strlen
	mov rdx, rax ; strlen return the value an we save it in D
	mov rbx, rdi; we save the string in B
	inc rax; for null char
	mov rdi, rax; and we prepare the argument for the malloc call
	;mov rdi, 999999999999999999
	call malloc wrt ..plt
	test rax, rax
	je .error 
	mov r8, rax
	xor rcx, rcx
	xor rax, rax

.loop:
	cmp rcx, rdx 
	je .done
	mov al, byte [rbx + rcx] ; al es la temporal para mover byte a byte
	mov byte [r8 + rcx], al 
	inc	rcx 
	jmp .loop

.error:
	pop rbx
	xor rax, rax
	ret

.done:
	mov byte [r8 + rcx], 0
	mov rax, r8
	pop rbx
	ret
