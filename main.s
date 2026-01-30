;nasm -f elf64 main.s -o main.o
;ld main.o <*.o> 

extern ft_strlen
extern ft_strcpy
default rel

section .rodata
	assembly db "--ASSEMBLY TEST--", 10, 0 
	strlen db "-strlen test-", 10, 0
	strcpy db "Strcpy test", 10, 0

section .bss
	buffer resb 4

section .data
	test_word db "H", 0 ;define byte
	res dq 0 

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

	mov rdi, strcpy
	call ft_strlen
	mov [res], rax 
	mov rax, 1
	mov rdi, 1
	mov rsi, strcpy
	mov rdx, [res]
	syscall
	
	mov rdi, buffer  
	mov rsi, test_word 
	call ft_strcpy
	
	mov rsi, rax
	call ft_strlen
	mov [res], rax 
	mov rax, 1
	mov rdi, 1
	mov rdx, [res]
	syscall
	
	mov rax, 60
	xor rdi, rdi
	syscall
