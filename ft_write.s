section .text
	global ft_write

ft_write:
	xor rax, rax

.write
	mov rax, 1
	syscall

.done:
 	ret
