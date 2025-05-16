 
//Experiment No:- 5 Problem Statement A Write ALP to interface stepper motor with 89S52 and rotate the stepper
motor in Wave drive stepping clockwise and anticlockwise direction for
360◦
continuously.
 
ORG 0000h                ; Set the origin (starting address) of the program to 0x0000

start:
    MOV P1, #00h        ; Initialize Port 1 to 00h (all bits of Port 1 are set to 0, i.e., all pins are low)
    MOV R7, #10h        ; Set R7 to 16 (for the number of iterations in the forward loop)

cw_loop:
    MOV P1, #01h        ; Set P1 to 01h (first pin on Port 1 high, others low)
    ACALL dalay         ; Call the delay subroutine to create a small delay
    MOV P1, #02h        ; Set P1 to 02h (second pin on Port 1 high, others low)
    ACALL dalay         ; Call the delay subroutine to create a small delay
    MOV P1, #04h        ; Set P1 to 04h (third pin on Port 1 high, others low)
    ACALL dalay         ; Call the delay subroutine to create a small delay
    MOV P1, #08h        ; Set P1 to 08h (fourth pin on Port 1 high, others low)
    ACALL dalay         ; Call the delay subroutine to create a small delay
    DJNZ R7, cw_loop    ; Decrement R7 and jump to 'cw_loop' if R7 is not zero (repeat the loop 16 times)

acw_loop:
    MOV R7, #10h        ; Reset R7 to 16 for reverse loop iterations (the number of times to reverse the sequence)

    MOV P1, #08h        ; Set P1 to 08h (fourth pin on Port 1 high, others low)
    ACALL dalay         ; Call the delay subroutine to create a small delay
    MOV P1, #04h        ; Set P1 to 04h (third pin on Port 1 high, others low)
    ACALL dalay         ; Call the delay subroutine to create a small delay
    MOV P1, #02h        ; Set P1 to 02h (second pin on Port 1 high, others low)
    ACALL dalay         ; Call the delay subroutine to create a small delay
    MOV P1, #01h        ; Set P1 to 01h (first pin on Port 1 high, others low)
    ACALL dalay         ; Call the delay subroutine to create a small delay
    DJNZ R7, acw_loop   ; Decrement R7 and jump to 'acw_loop' if R7 is not zero (repeat the loop 16 times)

dalay:                    ; Delay subroutine definition
    MOV R1, #0FFh        ; Initialize R1 to 255 (outer loop counter)
d1:
    MOV R5, #0FFh        ; Initialize R5 to 255 (inner loop counter)
d0:
    DJNZ R5, d0          ; Decrement R5 and loop back to 'd0' until R5 becomes zero (255 iterations)
    DJNZ R1, d1          ; Decrement R1 and loop back to 'd1' until R1 becomes zero (255 iterations)
    RET                  ; Return from delay subroutine when both R1 and R5 are zero

end                        ; End of program
