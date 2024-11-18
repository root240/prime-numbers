; Initialize data segment
section .data
    array_size: dd 10000  ; Adjust array size as needed
    array: times array_size db 1  ; Initialize array to all 1s

; Initialize code segment
section .text
    global _start

_start:
    ; Set up the loop counter and prime number candidate
    mov ecx, 2  ; Start from 2
    mov esi, 0  ; Index into the array

loop_start:
    cmp ecx, array_size
    jge end_loop

    ; Check if the current number is prime
    mov edx, [array + esi]
    cmp edx, 1
    jne next_prime

    ; Mark multiples of the current prime as non-prime
    mov ebx, ecx
    imul ebx, ecx
    add ebx, esi

loop_mark_multiples:
    cmp ebx, array_size
    jge next_prime

    mov [array + ebx], 0
    add ebx, ecx
    jmp loop_mark_multiples

next_prime:
    inc ecx
    inc esi
    jmp loop_start

end_loop:
    ; Print prime numbers (optional, can be customized)
    ; ...

    ; Exit the program
    mov eax, 1
    int 0x80
