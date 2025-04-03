; Name: Sayhan Shaik
; ID: 110156322


INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib


.data
    arr1 DWORD 23, 11, 43, 51, 60, 71, 82, 85, 96, 120
    arr2 DWORD 10 DUP(?) ; this is the destination array 

.code
main PROC
    call CopyingArrays
    call PrintingArrays
    exit
main ENDP

CopyingArrays PROC
    mov ecx, LENGTHOF arr1 ; tells us the number of array
    lea esi, arr1          ; source array
    lea edi, arr2          ; Destination array

CopyingLoop:
    mov eax, [esi]         ; copying the elemtn
    mov [edi], eax
    add esi, TYPE DWORD    ; Next source element
    add edi, TYPE DWORD    ; Next destination element
    loop CopyingLoop
    ret
CopyingArrays ENDP

PrintingArrays PROC
    mov edx, OFFSET arr1
    call PrintingArray  ;this is printing array1

    ; Print arr2
    mov edx, OFFSET arr2
    call PrintingArray ;prints arra2
    ret
PrintingArrays ENDP

PrintingArray PROC
    mov ecx, LENGTHOF arr1 ; printing elemtns of this array 
    mov esi, edx           ; adress of the array 

PrintingLoop:
    mov eax, [esi]         ;gets the elemt
    call WriteDec          ; Printing the value
    mov al, ' '            ; Printing the space
    call WriteChar
    add esi, TYPE DWORD    ; moves to the next element
    loop PrintingLoop
    call Crlf
    ret
PrintingArray ENDP

END main