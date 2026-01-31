section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax

;Segunda version
.loop: 
	mov dl, byte [rsi + rax]
	cmp [rdi + rax], dl
	inc rax
	;verificar si rdi sigue existiendo
	je .loop

.done:
	;aqui guardar en rax la diferencia de rsi y rdi
	;mov rax, rdi - rsi
	ret

;Primera version

.loop:
	;rdi -> s1
	;rsi -> s2
	mov dl, byte [rsi + rax]
	cmp [rdi + rax], dl
	jg .great 
	jl .less
	inc rax
	cmp [rdi + rax], 0
	je .equal
	cmp [rsi + rax], 0
	je .equal
	jmp .loop

;hay que retornar la diferencia :/

.great:
	mov rax, 1
	jmp.done

.less:
	mov rax, -1
	jmp .done

.equal:
	mov rax, 0
	jmp .done
	ret

.done:
	ret
