bits 64
global ft_strdup

extern ft_strcpy
extern ft_strlen
extern malloc

ft_strdup:
	xor rax, rax
	push rdi
	call ft_strlen
	mov rdi, rax
	inc rdi
	call malloc
	cmp rax, 0
	je .malloc_error
	mov rdi, rax
	pop rsi
	call ft_strcpy
	ret

.malloc_error:
	ret
