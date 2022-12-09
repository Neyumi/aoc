.model small
.stack 100
.data 

    fname1 db "input.txt",0
    text db 100
         db 0
             db 100 dup(0)
    fhand dw ?

.code
    mov ax,@data
    mov ds,ax

    mov ah,3dh
    mov al,0
    lea dx,fname1
    int 21h
    mov fhand,ax
    mov si,0
L:

    mov ah,3fh
    mov bx,fhand
    mov cx,1
    lea dx,text
    add dx,si
    int 21h
    cmp ax,0
    JE EXIT
    INC SI
    JMP L

EXIT:

    MOV BYTE PTR text,"$"
    ADD dx,si
    MOV AH,3EH
    INT 21H

    mov ah,9
    lea dx,text
    int 21h

    mov ah,4ch
    int 21h
end