 
//Experiment No:- 5 Problem Statement B Write ALP to interface stepper motor with 89S52 and rotate the stepper
motor in Full drive stepping clockwise and anticlockwise direction for
180◦
continuously.
5.9 PROBLE
 
ORG 0000H                  ; Set the origin (starting address) of the program to 0x0000

L1:                         ; Label for the main loop
    MOV P1, #01H            ; Set Port 1 to 01h (first pin high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #03H            ; Set Port 1 to 03h (first two pins high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #02H            ; Set Port 1 to 02h (second pin high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #06H            ; Set Port 1 to 06h (pins 2 and 3 high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #04H            ; Set Port 1 to 04h (third pin high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #0CH            ; Set Port 1 to 0Ch (pins 3 and 4 high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #08H            ; Set Port 1 to 08h (fourth pin high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #09H            ; Set Port 1 to 09h (pins 1 and 4 high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #01H            ; Set Port 1 to 01h (first pin high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #09H            ; Set Port 1 to 09h (pins 1 and 4 high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #08H            ; Set Port 1 to 08h (fourth pin high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #0CH            ; Set Port 1 to 0Ch (pins 3 and 4 high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #04H            ; Set Port 1 to 04h (third pin high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #06H            ; Set Port 1 to 06h (pins 2 and 3 high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #02H            ; Set Port 1 to 02h (second pin high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #03H            ; Set Port 1 to 03h (first two pins high, others low)
    ACALL delay             ; Call the delay subroutine
    MOV P1, #01H            ; Set Port 1 to 01h (first pin high, others low)
    ACALL delay             ; Call the delay subroutine
    SJMP L1                 ; Jump back to the start of the main loop (infinite loop)

delay:                       ; Delay subroutine
    MOV R2, #7             ; Set R2 to 7 (outer loop counter)
L3: 
    MOV R1, #255           ; Set R1 to 255 (middle loop counter)
L2: 
    MOV R0, #255           ; Set R0 to 255 (inner loop counter)
L4:
    DJNZ R0, L4            ; Decrement R0 and loop until it becomes 0
    DJNZ R1, L2            ; Decrement R1 and loop until it becomes 0
    DJNZ R2, L3            ; Decrement R2 and loop until it becomes 0
    RET                     ; Return from the delay subroutine

END                          ; End of the program
