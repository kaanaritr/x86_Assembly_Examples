org 100h
.DATA
 NUMS DB 25h,04h,59h,20h,10h,99h,05h,06h,'$'
 
 
.CODE
 MAIN PROC FAR
   
   MOV AX,@DATA ; DATA SEGMENT ADDRESS STORING TO DS
   MOV DS,AX 
   MOV BX,offset NUMS
   CALL SORTBIG   ; GREATER VALUE WILL BE STORED IN CH REGISTER

   MOV AH,00
   INT 16h ; WAIT KEYPRESS TO SEE SORTBIG PROCEDURE'S RESULT

   MOV BX,offset NUMS
   CALL SORTLIL   ; LOWEST VALUE WILL BE STORED IN CL REGISTER
   
   MOV AH,4Ch
   INT 21H 
    
    
 MAIN ENDP
 
 
 SORTBIG PROC
    MOV CH,0
 L1:
    MOV DL,[BX]  
    CMP DL,CH
    JB PASS1
    MOV CH,DL    
PASS1:  
    INC BX 
    CMP [BX],'$'
    JNZ L1
 
    RET    
 SORTBIG ENDP
 
 
 SORTLIL PROC
    MOV CL,0FFh  
 L2:
    MOV DL,[BX]
    CMP DL,CL
    JA PASS2
    MOV CL,DL
 PASS2:
    INC BX
    CMP [BX],'$'
    JNZ L2
    
    
    RET
 SORTLIL ENDP

END MAIN
 
 
