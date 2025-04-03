; Name: Sayhan Shaik 
; ID:110152718

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib 
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data 
    matrix DWORD 4 DUP(4 DUP(?)); this a 4x4 DWORD matrix initialization 

.code   
main PROC
    call InitialMatrix
    call PrintingMatrix
    exit
main ENDP

InitialMatrix PROC
    mov ecx, 16 ; now means there are 16 elements in the 4x4 matrix
    lea edi , matrix; now we are loading the adress of the matrix
    mov eax,1 ; now eax is equal to 1

InitialLooping:
    mov [edi], eax ; value of eax is now being stored
    add edi , TYPE DWORD; 
    inc eax; 
    loop InitialLooping
InitialMatrix ENDP

PrintingMatrix PROC
    mov ecx, 4 ; this is being done to create 4 rows
    lea esi, matrix; loading matrixs address

PrintingMatrixLoop: ;main idea is for printing rows of the loop
    push ecx ; saving the row counters
    mov ecx,4 ;4columns
PrintColumnLoop:
    mov eax, [esi] ;moving esi into eax with the goal of getting the elemnt
    call WriteDec
    mov al, ' ' ;this will make it print spaces
    call WriteChar
    add esi, TYPE DWORD ; next element 
    loop PrintColumnLoop
    call Crlf ; prints newline after row
    pop ecx 
    loop PrintingMatrixLoop
    ret 
PrintingMatrix ENDP

END main