;nasm -f elf64 main.s -o main.o
;ld main.o <*.o> 

extern ft_strlen
default rel

section .rodata
	assembly db "--ASSEMBLY TEST--", 10, 0 
	strlen db "-strlen test-", 10, 0
	strcpy db "Strcpy test", 10, 0

section .data
	test_strlen db "Hello World", 0 ;define byte
	res db 0 

section .text
	global _start

_start:
	mov rdi, assembly
	call ft_strlen
	mov [res], rax 
	mov rax, 1
	mov rdi, 1
	mov rsi, assembly 
	mov rdx, [res]
	syscall

	mov rdi, strlen
	call ft_strlen
	mov [res], rax 
	mov rax, 1
	mov rdi, 1
	mov rsi, strlen
	mov rdx, [res]
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
