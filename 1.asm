             .MODEL SMALL
.STACK 64
.DATA    
    source db 20 dup(?) ,'$'
    dest db 20 dup(?) ,'$'
    enter dw 'enter input: $'
    orginal dw 'your input: $' 
    backwords dw 'backwords: $' 
               
.CODE
main:
    mov ax,@DATA ;get data segment
    mov ds, ax   ;initailize DS
    
        
    ;print 'enter input' messege
    mov ah, 9
    mov dx, offset enter
    int 21h
    
    ;new line
    mov ah,2
    mov dx,13
    int 21h
    mov dx,10
    int 21h        
                  
    
    mov ah, 1
    lea si,  source ;assigning the first effective address of source to si  
    ;loop for reading information from the user
     
    mov cx,  20 
    input:
    int 21H
    mov [si], al
    inc si
    loop input
               
    ;new line
    mov ah,2
    mov dx,13
    int 21h
    mov dx,10
    int 21h
               
    lea di, dest+19 ;assigning the last effective address of dest to di 
    lea si, source  ;assigning the first effective address of source to si
    
    ;loop for assigning the backwords string to dest 
    mov cx, 20
    back:
    mov al, [si]
    mov [di], al
    inc si 
    dec di    
    loop back
    
    ;new line
    mov ah,2
    mov dx,13
    int 21h
    mov dx,10
    int 21h
    
    ;print 'your input' messege
    mov ah, 9
    mov dx,  offset orginal
    int 21h
    
    ;new line
    mov ah,2
    mov dx,13
    int 21h
    mov dx,10
    int 21h
           
   
    lea si, source ;assigning the first effective address of source to si
    
     ;loop for printing source 
    mov cx, 20 
    printSource:
    mov dx,[si]
    int 21H   
    inc si
    loop printSource
    
    ;new line
    mov ah,2
    mov dx,13
    int 21H
    mov dx, 10
    int 21H
    
    ;print 'backwords' messege                
    mov ah, 9
    mov dx, offset backwords
    int 21h
    
    mov ah,2
    mov dx,13
    int 21h
    mov dx,10
    int 21h  
    
    
    lea si, dest ;assigning the first effective address of dest to si 
    
    ;loop for printing dest
    mov cx, 20 
    printDest:
    mov dx,[si]
    int 21H   
    inc si
    loop printDest
    
    mov ah, 4CH
    int 21H
END main    
    