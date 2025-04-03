; Name: Sayhan Shaik 
; Student ID: 110152718
; R = [(A-B)*(-C)]/D + (-E)

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    promptA BYTE "Enter A: ", 0 
    promptB BYTE "Enter B: ",0
    promptC BYTE "Enter C: ",0
    promptD BYTE "Enter D: ",0
    promptE BYTE "Enter E: ",0
    resultPrompt BYTE "Computed Result: ",0

    arr SDWORD 5 DUP(?) ;
    result SDWORD ? 

.code 
main PROC 
    mov esi, OFFSET arr ; points to the start of the array
    mov edx, OFFSET promptA
    call WriteString 
    call ReadInt
    mov [esi],eax ;stores promptA in first element arr
    
    mov edx, OFFSET promptB 
    call WriteString
    call ReadInt
    mov [esi+4],eax ;stores promptB in the second element of the array

    mov edx, OFFSET promptC
    call WriteString
    call ReadInt
    mov [esi+8], eax ; stores promptC in the third element

    mov edx, OFFSET promptD
    call WriteString
    call ReadInt
    mov [esi+12],eax ;stores promptD in the fourth element of the arr

    mov edx, OFFSET promptE
    call WriteString
    call ReadInt 
    mov [esi+16],eax ;stores promptE in the fifth element of the arr

    mov eax, [esi] ;loading promptA in EAX 
    sub eax, [esi+4] ;A-B
    mov ebx,[esi+8] ;moving C into ebx
    neg ebx ; now is -C
    imul eax,ebx ;(A-B)*(-C)

    mov ebx,[esi+12] ; load D into ebx 
    cdq ;mainly for the purpose of signed division 
    idiv ebx ; [(A-B)*(-C)] / D

    sub eax,[esi+16]; -E
    mov result, eax

    mov edx, OFFSET resultPrompt  ;loading result message
    call WriteString 
    mov eax,result ;result is being loaded now 
    call WriteInt
    call Crlf
    call ExitProcess
main ENDP

END main






