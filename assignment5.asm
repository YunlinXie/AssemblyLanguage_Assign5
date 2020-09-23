TITLE assignment5.asm

; Program Description: Determine whether an input is a prime number
; Student Name: Yunlin Xie
; Date: 05/14/2019

INCLUDE Irvine32.inc

.data
QUESTION_MSG  BYTE   "Enter an integer larger than 1: ", 0
ERROR_MSG     BYTE   "Input must be larger than 1", 0
PRIME_MSG     BYTE   "Prime", 0
Nprime_MSG    BYTE   "Not Prime", 0
CONTINUE_MSG  BYTE   "Continue? y/n: "




.code
main PROC


INPUT:
mov edx, OFFSET QUESTION_MSG
call writeString
call readInt

cmp eax, 1
jg CHECK1
mov edx, OFFSET ERROR_MSG
call writeString
call crlf
jmp INPUT


CHECK1:
cmp eax, 2
je RESULT2
cmp eax, 3
je RESULT2


;;;;;;BEGIN CHECKING;;;;;;;
mov ebx, eax
mov edx, 0
mov ecx, 2
div ecx

mov ecx, eax
CHECK2:
mov eax, ebx
mov edx, 0
div ecx

cmp edx, 0
je RESULT1
cmp ecx, 2
je RESULT2
loop CHECK2


RESULT1:
mov edx, OFFSET Nprime_MSG
call writestring
call crlf
jmp CONTINUE


RESULT2:
mov edx, OFFSET PRIME_MSG
call writestring
call crlf
jmp CONTINUE


CONTINUE:
mov edx, OFFSET CONTINUE_MSG
call writestring
call readChar
call writeChar
call crlf
cmp al, 'y'
je INPUT
cmp al, 'Y'
je INPUT






		exit
main ENDP

END main