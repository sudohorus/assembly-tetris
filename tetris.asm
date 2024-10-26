section .data
    ;defines characters to render the game 
    empty_char db ' '        ; empty space
    filled_char db '#'       ; filled block
    screen_width db 40       ; playing field width
    screen_height db 25      ; playing field height

section .bss
    screen resb 1000         ; buffer for the playing field (40x25)
    game_over db 0           ; flag to indicate end of game

section .text
global _start

_start:
    call initialize_game
    call render_screen        ; renders the main screen
    call game_loop            ; call the main loop

initialize_game:
    ; clean screen buffer
    mov rdi, screen
    mov rcx, 1000            ; buffer size
    xor rax, rax              ; fill with 0
    rep stosb                 ; fill the memory
    ret

render_screen:
    ; renders screen buffer
    mov rsi, screen           ; pointer to handle buffer
    mov rbx, 0                ; line counter

.render_loop:
    ; loop for render each line
    cmp rbx, screen_height
    jge .done                 ; if all lines have been rendered, exit

    ; render one line
    mov rdi, screen_width     ; game field width
    mov rdx, rbx              ; current line
    call render_line          ; call the function to render line
    inc rbx                   ; increments the line counter 
    jmp .render_loop          ; repeat the loop

.done:
    ret

render_line:
    ; render a line from the playing field
    ; here, modify render
    ; the characters of the game buffer            
    ; here must print the characters on the screen
    ; using syscall to write
    mov rax, rdi
    mov rax, 1                ; syscall for write
    mov rdi, 1                ; 1 = stdout
    mov rdx, rdi              ; line size (40)
    syscall                   ; call the system

    ret

game_loop:
    jmp game_loop
