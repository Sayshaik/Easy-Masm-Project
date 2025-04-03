; Name: Sayhan Shaik 
; ID: 110152718

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    A DWORD 20
    B DWORD 10
    F DWORD 5 ;using F cause C causes syntax error
    D DWORD 50
    E DWORD 15
    Result DWORD ?

    ptrA DWORD A
    ptrB DWORD B
    ptrC DWORD F
    ptrD DWORD D 
    ptrE DWORD E 

.code
main PROC
    ; we are first computing sum of A and B
    mov eax, A ; helps load value of A into eax
    add eax, B ; adds now the value of A and B
    mov ebx, eax   ; now moves the sum value of eax into ebx
    call DumpRegs
    ; we are now multiplying sum values of AB with C
    mov ecx, F ;value of f being moved into ecx
    xor edx, edx ;where the value of the muktiplication is stored

    looping:
        add edx, ebx
        loop looping 
    call DumpRegs
    ;now computing difference of D and E
    mov eax, D
    sub eax, E ; subtraction of D and E
    mov esi , eax ;subtraction value is now stored in esi

    ; (ABC)-(D-E)
    sub edx, esi ; final value of ABC - DE will be stored in edx

    ; now the final value will be stored in Result variable

    mov DWORD PTR [Result], edx
    call DumpRegs
    exit

main ENDP
End main