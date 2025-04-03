;Name: Lara Shreim
;Student ID: 110131166
;Assignment_3 

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data 
    User BYTE "Enter String : ", 0
    result BYTE "Sum of Individual digits is: ", 0 
    input BYTE 100 DUP(0)
    totalSum DWORD 0

.code 
main PROC 
    mov edx, OFFSET User
    call WriteString

    mov edx, OFFSET input 
    mov ecx, SIZEOF input
    call ReadString

    mov esi, OFFSET input
    mov ebx, 0 

processChar:
    mov al,[esi] 
    cmp al, 0
    je perform 

    cmp al, '0' 
    jb NotNumber
    cmp al, '9'
    ja NotNumber

    sub al,'0' 
    add ebx, eax

NotNumber:
    inc esi 
    jmp processChar

perform: 
    mov edx, OFFSET result 
    call WriteString
    mov eax, ebx 
    call WriteDec
    call Crlf
    exit
main ENDP 
END main