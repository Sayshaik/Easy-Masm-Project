;Name: Sayhan Shaik
;Student ID: 110152718
;Lab8 which is ((A+B)/C)*((D-A)+E) which is quite similar to lab6and7

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    promptA BYTE "Enter A: ",0
    promptB BYTE "Enter B: ",0
    promptC BYTE "Enter C: ",0
    promptD BYTE "Enter D: ",0
    promptE BYTE "Enter E: ",0
    resultPrompt BYTE "The Computed result is: ", 0

    arr SDWORD 5 DUP(?);
    result SDWORD ? ; same variables as lab6&7
.code 
main PROC 
    mov esi, OFFSET arr ; points to the start of the array
    mov edx, OFFSET promptA
    call WriteString 
    call ReadInt 
    mov[esi], eax;stores promptA in first element arr

    mov edx, OFFSET promptB
    call WriteString 
    call ReadInt 
    mov [esi+4], eax ;stores promptB in the second element of the array

    mov edx, OFFSET promptC 
    call WriteString 
    call ReadInt
    mov [esi+8], eax ;stores promptC in the third element

    mov edx, OFFSET promptD
    call WriteString 
    call ReadInt 
    mov [esi+12], eax ;stores promptD in the fourth element of the arr

    mov edx, OFFSET promptE 
    call WriteString 
    call ReadInt 
    mov [esi+16], eax ;tores promptE in the fifth element of the arr

    mov eax, [esi];loading promptA in EAX 
    add eax, [esi+4]; A+B
    cdq ; used this for division now 
    mov ebx, [esi+8]; now loading promptC in ebx
    idiv ebx; ((A+B)/C)

    mov ecx, [esi+12]; loading promptD in ecx
    sub ecx, [esi] ; D-A
    add ecx, [esi+16];((D-A)+E)

    imul eax,ecx; ((A+B)/C)*((D-A)+E)
    mov result,eax ;final value from eax is stored in result 
    call Crlf 
    mov edx, OFFSET resultPrompt;loading result message
    call WriteString 
    mov eax, result
    call WriteInt
    call Crlf
    call ExitProcess
main ENDP 
END main 