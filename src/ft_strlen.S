bits 64
global ft_strlen

ft_strlen:
	xor rax, rax
	jmp .loop

.loop:
	cmp BYTE [rdi + rax], 0
	je .end_loop
	inc rax
	jmp .loop
.end_loop:
	ret
