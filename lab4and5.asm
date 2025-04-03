;Name: Sayhan Shaik
;Student ID: 110152718
;Binary Sort is being done 

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    arr SDWORD 5, -3, 8, 12, -7, 6, 4, 10, 2, 0 ;an array of 32 bits 
    array_size DWORD LENGTHOF arr  ;  shows number of elements in the array

    ; Strings for output
    Original_message BYTE "Original Array: ", 0
    Sorted_message BYTE "Sorted Array: ", 0
    space BYTE " ", 0
    showminus_sign BYTE "-", 0   ; assigns minus sign in strings to negative numbers

.code
main PROC
    
    mov edx, OFFSET Original_message ;displayes originial array
    call WriteString
    call PrintingArray

    call BubbleSort

    mov edx, OFFSET Sorted_message ;displays sorted array
    call WriteString
    call PrintingArray

    INVOKE ExitProcess, 0
main ENDP


; This is the PrintingArray Procedure

PrintingArray PROC
    mov esi, OFFSET arr     ; Points start of the array
    mov ecx, array_size        ; Number of elements in the array

DisplayLoop:
    mov eax, [esi]        
    cmp eax, 0              ; Checking if number is negative
    jge PrintNumber         ; skips printing minus if it is positive or zero
    
    mov edx, OFFSET showminus_sign
    call WriteString
    neg eax                 ; Converts it to positive number 

PrintNumber:
    call WriteDec          
    mov edx, OFFSET space
    call WriteString        
    add esi, 4              ;Moving to the next element
    loop DisplayLoop        ; this is done so it repeats for all elements

    call Crlf               
    ret
PrintingArray ENDP

; This is the BubbleSort Procedure

BubbleSort PROC
    mov ecx, array_size     ;counts number of passes
    dec ecx                 ; arraysize -1 

OuterLoop:
    mov esi, OFFSET arr     ; Pointer to start of the array
    mov edx, ecx            ; Inner loop counter 

InnerLoop:
    mov eax, [esi]          
    mov ebx, [esi + 4]      
    cmp eax, ebx            ; Compares current and next element
    jle NoSwap           

    ; Swap the elements
    mov [esi], ebx          ; Moving the next element to the current position
    mov [esi + 4], eax      ; Moving current element to next position

NoSwap:
    add esi, 4              ; Move to the next pair of elements
    dec edx                 ; Decrement inner loop counter
    jnz InnerLoop           

    loop OuterLoop          

    ret
BubbleSort ENDP

END main