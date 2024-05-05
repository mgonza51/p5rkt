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
	sub rsp, 448
	mov esi, 2
	mov [rbp-64], esi
	mov esi, 3
	mov [rbp-48], esi
	mov esi, [rbp-64]
	mov [rbp-32], esi
	mov edi, [rbp-48]
	mov eax, [rbp-32]
	add eax, edi
	mov [rbp-32], eax
	mov esi, 4
	mov [rbp-16], esi
	mov esi, 2
	mov [rbp-184], esi
	mov esi, [rbp-16]
	mov [rbp-176], esi
	mov edi, [rbp-184]
	mov eax, [rbp-176]
	sub eax, edi
	mov [rbp-176], eax
	mov esi, [rbp-32]
	mov [rbp-224], esi
	mov edi, [rbp-176]
	mov eax, [rbp-224]
	imul eax, edi
	mov [rbp-224], eax
	mov esi, 0
	mov [rbp-72], esi
	mov edi, [rbp-72]
	mov eax, [rbp-224]
	cmp eax, edi
	mov [rbp-224], eax
	jz lab1281
	jmp lab1283
lab1281:	mov esi, 10
	mov [rbp-216], esi
	mov esi, [rbp-216]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1283:	mov esi, 5
	mov [rbp-208], esi
	mov esi, 3
	mov [rbp-160], esi
	mov esi, 3
	mov [rbp-200], esi
	mov esi, [rbp-160]
	mov [rbp-144], esi
	mov edi, [rbp-200]
	mov eax, [rbp-144]
	add eax, edi
	mov [rbp-144], eax
	mov esi, [rbp-208]
	mov [rbp-192], esi
	mov edi, [rbp-144]
	mov eax, [rbp-192]
	sub eax, edi
	mov [rbp-192], eax
	mov esi, 0
	mov [rbp-88], esi
	mov edi, [rbp-88]
	mov eax, [rbp-192]
	cmp eax, edi
	mov [rbp-192], eax
	jz lab1289
	jmp lab1291
lab1289:	mov esi, 20
	mov [rbp-120], esi
	mov esi, [rbp-120]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1291:	mov esi, 1
	mov [rbp-96], esi
	mov esi, 2
	mov [rbp-80], esi
	mov esi, [rbp-96]
	mov [rbp-56], esi
	mov edi, [rbp-80]
	mov eax, [rbp-56]
	add eax, edi
	mov [rbp-56], eax
	mov esi, 0
	mov [rbp-104], esi
	mov edi, [rbp-104]
	mov eax, [rbp-56]
	cmp eax, edi
	mov [rbp-56], eax
	jz lab1295
	jmp lab1297
lab1295:	mov esi, 30
	mov [rbp-40], esi
	mov esi, [rbp-40]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1297:	mov esi, 40
	mov [rbp-24], esi
	mov esi, [rbp-24]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 448
	leave 
	ret 

