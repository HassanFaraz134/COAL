[org 0x100]       

start:

    ; print input message
    mov ah, 09h          
    mov dx, msg          
    int 21h              

    ; read a single digit from user (0-9)
    mov ah, 01h          
    int 21h              
    mov bl, al          

    ; print newline
    mov ah, 09h
    mov dx, newline
    int 21h

    ; convert ASCII digit to number
    sub bl, '0'          
    mov cl, bl           

    ; Initialize Fibonacci sequence
    mov bx, 0            
    mov si, 1            

find_loop:
    ; If F(n) >= user input, stop searching
    cmp si, cx           
    jge found            

    ; move to next Fibonacci number
    mov ax, si           
    add ax, bx           
    mov bx, si           
    mov si, ax           
    jmp find_loop        

found:
    ; SI now has the Fibonacci number >= input
    ; Check which is closer: SI (current) or BX (previous)

    mov ax, si           
    sub ax, cx           

    mov di, cx           
    sub di, bx           
	

    cmp ax, di           
    jle use_current      

    mov si, bx           

use_current:
    ; Print result message
    mov ah, 09h
    mov dx, result_msg
    int 21h

    ; Print the result digit
    mov ax, si           
    add ax, '0'          
    mov dl, al           
    mov ah, 02h          
    int 21h

    ; Print newline
    mov ah, 09h
    mov dx, newline
    int 21h

    ; Exit program
    mov ah, 4Ch          
    mov al, 0            
    int 21h

msg        db 'Enter a number (0-9): $'
result_msg db 'Nearest Fibonacci Number is: $'
newline    db 13, 10, '$'   ; carriage return + line feed
