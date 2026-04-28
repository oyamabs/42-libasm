bits 64
global ft_write

extern __errno_location

;; List of syscalls is pulled from /usr/include/asm/unistd_64.h
;; kernel 6.8.0 #101~22.04.1-Ubuntu
ft_write:
	mov rax, 1 ;; write is syscall 1
	syscall
	test rax, rax
	jc .error
	ret
.error:
	neg rax
	mov rdi, rax
	call __errno_location
	mov [rax], rdi
	mov rax, -1
	ret
