section .text
	global ft_write

ft_write:
	xor rax, rax
	mov rax, 1
	syscall

.done:
	mov rax, rdx 
 	ret
