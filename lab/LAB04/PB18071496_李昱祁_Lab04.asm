	.ORIG x3000
        ;
        ;initialization
        ;
        LD R2,Argument
        LD R6,BASE

        TRAP x20        ;GETC()
        LD R1,negZERO
        ADD R0,R0,R1    ;calculate n
        
        STR R0,R2,#0    ;Copy arguments to the interface location in calling convention
        AND R0,R0,#0       
        STR R0,R2,#1        
        STR R0,R2,#2       
        STR R0,R2,#3        
        STR R0,R2,#4       
        STR R0,R2,#5       
        STR R0,R2,#6
        
        JSR FUNC        ;call func
        
END	    HALT

        
FUNC    ADD R6,R6,#11   ;Store the information of the last function
        LD R1,NEGMAX
        ADD R1,R6,R1
        BRn    continue
        LEA R0,MSG
        PUTS
        BR     END

continue        LDR R0,R2,#0    ;copy variables to the STACK
        STR R0,R6,#0
        LDR R0,R2,#1
        STR R0,R6,#-1
        LDR R0,R2,#2
        STR R0,R6,#-2
        LDR R0,R2,#3
        STR R0,R6,#-3
        LDR R0,R2,#4
        STR R0,R6,#-4
        LDR R0,R2,#5
        STR R0,R6,#-5
        LDR R0,R2,#6
        STR R0,R6,#-6
        STR R7,R6,#-10
        
        ;calculate t
        TRAP x20        ;GETC()
        LDR R7,R6,#-10
        LD R1,negZERO
        ADD R0,R1,R0    ;SUB '0'
        LDR R1,R6,#-1
        ADD R0,R1,R0    ;ADD a
        LDR R1,R6,#-2
        ADD R0,R1,R0    ;ADD b
        LDR R1,R6,#-3
        ADD R0,R1,R0    ;ADD c
        LDR R1,R6,#-4
        ADD R0,R1,R0    ;ADD d
        LDR R1,R6,#-5
        ADD R0,R1,R0    ;ADD e
        LDR R1,R6,#-6
        ADD R0,R1,R0    ;ADD f
        
        STR R0,R6,#-7    ;Store t
        LDR R0,R6,#0
        ADD R0,R0,#-1
        BRnz label
        
        LDR R1,R6,#0
        ADD R1,R1,#-1   
        STR R1,R2,#0
        LDR R1,R6,#-1
        STR R1,R2,#1
        LDR R1,R6,#-2
        STR R1,R2,#2
        LDR R1,R6,#-3
        STR R1,R2,#3
        LDR R1,R6,#-4
        STR R1,R2,#4
        LDR R1,R6,#-5
        STR R1,R2,#5
        LDR R1,R6,#-6
        STR R1,R2,#6
        JSR FUNC        ;µ›πÈº∆À„func(n-1,a,b,c,d,e,f)
        STR R0,R6,#-8   ;store x
        LDR R7,R6,#-10
        
        LDR R1,R6,#0
        ADD R1,R1,#-2   
        STR R1,R2,#0
        LDR R1,R6,#-1
        STR R1,R2,#1
        LDR R1,R6,#-2
        STR R1,R2,#2
        LDR R1,R6,#-3
        STR R1,R2,#3
        LDR R1,R6,#-4
        STR R1,R2,#4
        LDR R1,R6,#-5
        STR R1,R2,#5
        LDR R1,R6,#-6
        STR R1,R2,#6
        JSR FUNC        ;µ›πÈº∆À„func(n-2,a,b,c,d,e,f)
        STR R0,R6,#-9   ;store y
        LDR R7,R6,#-10
        
        AND R0,R0,#0    ;calculate x+y+t-1
        LDR R1,R6,#-7
        ADD R0,R1,R0
        LDR R1,R6,#-8
        ADD R0,R1,R0
        LDR R1,R6,#-9
        ADD R0,R1,R0
        ADD R0,R0,#-1    

        ADD R6,R6,#-11
        RET


label   LDR R0,R6,#-7
        ADD R6,R6,#-11       
        RET

negZERO    .FILL xFFD0   
BASE    .FILL xC100
MAX     .FILL xEFFF
Argument    .FILL xC001
MSG     .STRINGZ "Stackoverflow!"
NEGMAX  .FILL x1001
    .END