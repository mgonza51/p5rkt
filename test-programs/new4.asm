section .data
	int_format db "%ld",10,0


	global _main
	extern _printf
section .text


_start:	call _main
	mov rax, 60
	xor rdi, rdi
	syscall


_main:	push rbp
	mov rbp, rsp
	sub rsp, 240
	mov esi, 1
	mov [rbp-96], esi
	mov esi, 2
	mov [rbp-88], esi
	mov esi, [rbp-96]
	mov [rbp-80], esi
	mov edi, [rbp-88]
	mov eax, [rbp-80]
	add eax, edi
	mov [rbp-80], eax
	mov esi, 0
	mov [rbp-24], esi
	mov edi, [rbp-24]
	mov eax, [rbp-80]
	cmp eax, edi
	mov [rbp-80], eax
	jz lab1267
	jmp lab1269
lab1267:	mov esi, 50
	mov [rbp-16], esi
	mov esi, [rbp-16]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1269:	mov esi, 3
	mov [rbp-72], esi
	mov esi, 2
	mov [rbp-64], esi
	mov esi, [rbp-72]
	mov [rbp-120], esi
	mov edi, [rbp-64]
	mov eax, [rbp-120]
	imul eax, edi
	mov [rbp-120], eax
	mov esi, 0
	mov [rbp-40], esi
	mov edi, [rbp-40]
	mov eax, [rbp-120]
	cmp eax, edi
	mov [rbp-120], eax
	jz lab1273
	jmp lab1275
lab1273:	mov esi, 70
	mov [rbp-48], esi
	mov esi, [rbp-48]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1275:	mov esi, 80
	mov [rbp-32], esi
	mov esi, [rbp-32]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 240
	leave 
	ret 

