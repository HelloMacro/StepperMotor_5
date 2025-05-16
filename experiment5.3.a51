 
//Experiment No:- 5 Problem Statement C
 //Write ALP to interface stepper motor with 89S52 and rotate the stepper
motor in half drive stepping clockwise and anticlockwise direction for
360◦ continuously.

ORG 0000H         ; Start address of the program

    MOV P2, #00H  ; Initialize Port 2 to 00h (Clear all bits for stepper motor control)
    MOV R1, #48H  ; Set R1 to 72 (Decimal 72). This will be used for controlling the forward steps
    MOV R2, #48H  ; Set R2 to 72 (Decimal 72). This will be used for controlling the reverse steps

LOOP:  
    ; Forward movement steps (360 degrees, one complete cycle)
AGAIN: 
    MOV P2, #08H  ; Step 1: Set Port 2 to 08h (45 degrees clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #0CH  ; Step 2: Set Port 2 to 0Ch (90 degrees clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #04H  ; Step 3: Set Port 2 to 04h (135 degrees clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #06H  ; Step 4: Set Port 2 to 06h (180 degrees clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #02H  ; Step 5: Set Port 2 to 02h (225 degrees clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #03H  ; Step 6: Set Port 2 to 03h (270 degrees clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #01H  ; Step 7: Set Port 2 to 01h (315 degrees clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #09H  ; Step 8: Set Port 2 to 09h (360 degrees / 0 degrees clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    DJNZ R1, AGAIN ; Decrement R1 and repeat the loop if R1 is not zero (repeat the forward cycle)

    ; Reverse movement steps (360 degrees, one complete cycle)
AGAIN2: 
    MOV P2, #09H  ; Step 1: Set Port 2 to 09h (360/0 degrees counter-clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #01H  ; Step 2: Set Port 2 to 01h (315 degrees counter-clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #03H  ; Step 3: Set Port 2 to 03h (270 degrees counter-clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #02H  ; Step 4: Set Port 2 to 02h (225 degrees counter-clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #06H  ; Step 5: Set Port 2 to 06h (180 degrees counter-clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #04H  ; Step 6: Set Port 2 to 04h (135 degrees counter-clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #0CH  ; Step 7: Set Port 2 to 0Ch (90 degrees counter-clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #08H  ; Step 8: Set Port 2 to 08h (45 degrees counter-clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    MOV P2, #09H  ; Step 9: Set Port 2 to 09h (360 degrees / 0 degrees counter-clockwise)
    ACALL DELAY   ; Call the DELAY subroutine to create a delay
    
    DJNZ R2, AGAIN2 ; Decrement R2 and repeat the loop if R2 is not zero (repeat the reverse cycle)

    SJMP LOOP  ; Jump to the start of the loop to repeat the entire sequence (forward + reverse)

; 1-Second Delay Subroutine (Approximate for 11.0592 MHz Clock)
DELAY:
    MOV R2, #155   ; Set outer loop counter to 155 (this will create an approximate delay)
D1:
    MOV R4, #255   ; Set the inner loop counter to 255
D2:
    MOV R0, #255   ; Set another inner loop counter to 255
D3:
    DJNZ R0, D3    ; Decrement R0 and loop until it reaches zero
    DJNZ R4, D2    ; Decrement R4 and loop until it reaches zero
    DJNZ R2, D1    ; Decrement R2 and loop until it reaches zero
    RET            ; Return from delay subroutine

END                  ; End of the program
