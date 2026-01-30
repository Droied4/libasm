extern ft_strlen

section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax

.loop:
	cmp rdi, rsi

.done:
	ret
