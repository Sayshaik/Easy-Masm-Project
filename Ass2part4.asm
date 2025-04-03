; Name: Sayhan Shaik
; ID: 110156322


INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    arr1 DWORD 23, 11, 43, 51, 60, 71, 82, 85, 96, 120
    arr2 DWORD 5 DUP(?) ; this is the destination array

.code
main PROC 
    call EvenNumbers
    call PrintingReverseNumArray
    exit
main ENDP

EvenNumbers PROC
    mov ecx, LENGTHOF arr1   ;we r counting even numbers first
    lea esi, arr1
    mov ebx, 0  ;ebx is the count of even numbers
CountEvenNumLoop:
    mov eax, [esi]
    test eax, 1
    jnz NOTEVEN 
    inc ebx 
NOTEVEN: 
    add esi, TYPE DWORD
    loop CountEvenNumLoop
    mov ecx, LENGTHOF arr1
    lea esi, arr1 
EvenLoop:
    mov eax, [esi]
    test eax,1
    jnz Pushskip
    push eax
Pushskip:
    add esi, TYPE DWORD
    loop EvenLoop

    mov ecx,ebx ; it is now being popped into arr2 and ecx shows the number of even elements
    lea edi,arr2 
popEvenLoop:
    pop eax;
    mov [edi],eax;
    add edi, TYPE DWORD
    loop popEvenLoop
    ret 
EvenNumbers ENDP

PrintingReverseNumArray PROC    
    mov ecx, LENGTHOF arr2; length is 5
    lea esi, arr2
looping:
    mov eax, [esi]
    call WriteDec
    mov al, ' '
    call WriteChar
    add esi, TYPE DWORD
    loop looping
    call Crlf
    ret 
PrintingReverseNumArray ENDP

END main