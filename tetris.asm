section .bss
    screen resb 1000    ;buffer for the playing field (40x25)
    game_over db 0      ;flag to indicate end of game


section .text
global _start

_start:
    call initialize_game
    call game_loop      ;call the main loop of game

initialize_game:
    ;clean screen buffer
    mov rdi, screen
    mov rcx, 1000       ;buffer size
    xor rax, rax         ;fills with 0
    rep stosb           ;fill the memory
    ret

game_loop:
    ;another game functions
    jmp game_loop       ;continuous loop for now

