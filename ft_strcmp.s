section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax
	xor rcx, rcx

.loop: 
	mov al, byte [rdi + rcx]
	mov dl, byte [rsi + rcx]
	
	cmp al, dl
	jne .diff
	
	test al, al
	je .done

	inc rcx
	jmp .loop

.diff:
	movzx eax, al
	movzx edx, dl
	sub eax, edx 
	ret

.done:
	xor rax, rax 
	ret
