.MODEL SMALL
.STACK 64
.DATA    
    source db 20 dup(?) ,'$' 
    inputMessege db 'please enter your input:$'
    output db 'to upper case:$'
               
.CODE
main:
    mov ax,@DATA ;get data segment
    mov ds, ax   ;initailize DS
    
    
    ;printing 'please enter your input' messege
    mov ah, 9
    lea dx, inputMessege 
    int 21H 
   
   
    ;new line
    mov ah,2
    mov dx,13
    int 21H
    mov dx, 10
    int 21H
    
    
    mov ah, 1      
    lea si, source 
    ;loop for getting input from the user
    mov cx, 20
    input:
    int 21H
    mov [si], al
    inc si
    loop input
    
    ;new line
    mov ah,2
    mov dx,13
    int 21H
    mov dx, 10
    int 21H
    
    ;loop on source for checking each char if is lower case or not
    mov cx,20
    lea si,  source         
    checkAndReplace:   
    cmp [si], 97  
    JAE secondCheck;if Ascii value of char is bigger then 97 jump to the next check
    
    next:
    inc si
    loop checkAndReplace
    
    
    ;printing 'to upper case' messege
    mov ah, 9
    lea dx, output 
    int 21H
    
    
    ;new line
    mov ah,2
    mov dx,13
    int 21H
    mov dx, 10
    int 21H
    
    ;loop on source for printing    
    mov cx, 20 
    lea si, source
    print:
    mov dx,[si]
    int 21H   
    inc si
    loop print
    
    JMP exit    
    
    secondCheck:
    cmp [si], 123
    JL toUpper ;if Ascii value of char is less then 123 jump to toUpper
    JMp next   ;else jump back to next - inc si and if the loop isnt end yet check the next char
    
    toUpper:
    sub [si],32 ;by subbing 32 from the Ascii value of the char change it to upper case
    JMp next  ;jump back to next - inc si and if the loop isnt end yet check the next char
    
    exit:
        mov ah, 4CH
        int 21H
   
END main    
    
    
    