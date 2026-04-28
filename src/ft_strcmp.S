bits 64
global ft_strcmp

ft_strcmp:
	xor rax, rax
	xor r8, r8
	xor r9, r9
	jmp .loop
.loop:
	mov r8b, [rdi + rax]
	mov r9b, [rsi + rax]
	cmp r8b, 0
	je .endloop
	cmp r8b, r9b
	jne .endloop
	inc rax
	jmp .loop
.endloop:
	sub r8, r9
	mov rax, r8
	ret
