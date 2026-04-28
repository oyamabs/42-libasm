bits 64
global ft_strcpy

ft_strcpy:
	xor rax, rax
	jmp .loop
.loop:
	cmp BYTE [rsi + rax], 0
	je .endloop
	mov r8, [rsi + rax]
	mov [rdi + rax], r8
	inc rax
	jmp .loop
.endloop:
	mov rax, rdi
	ret
