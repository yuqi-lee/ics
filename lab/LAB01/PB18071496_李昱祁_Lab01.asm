	.ORIG x3000
 	
	
	;First,sort the students by their grade

	LD R3,counter		;R3 is the counter
LOOP1	LD R2,BEGIN1		;R2 is pointer to character
	ADD R4,R3,#0
LOOP2	LDR R1,R2,#0
	LDR R0,R2,#1		
	NOT R5,R0
	ADD R5,R5,#1
	ADD R5,R5,R1
	BRP LOOP3
	STR R1,R2,#1
	STR R0,R2,#0
LOOP3	ADD R2,R2,#1
	ADD R4,R4,#-1
	BRP LOOP2		
	ADD R3,R3,#-1
	BRP LOOP1	

	
	;then store the data and classify the students

	LD R3,counter
	LD R2,BEGIN1
	LD R5,BEGIN2

	
	LD R0,SCOREA
	ADD R4,R3,#0
LOOP4	LDR R1,R2,#0
	STR R1,R5,#0
	ADD R6,R1,R0
	BRN COUNTA
	ADD R2,R2,#1
	ADD R5,R5,#1
	ADD R3,R3,#-1
	BRP LOOP4

COUNTA	NOT R1,R3
	ADD R1,R1,#1
	ADD R4,R4,R1
	LD R0,adress_a
	STR R4,R0,#0

	LD R0,SCOREA
	ADD R0,R0,#10
	ADD R4,R3,#0
LOOP5	LDR R1,R2,#0
	STR R1,R5,#0
	ADD R6,R1,R0
	BRN COUNTB
	ADD R2,R2,#1
	ADD R5,R5,#1
	ADD R3,R3,#-1
	BRP LOOP5

COUNTB  NOT R1,R3
	ADD R1,R1,#1
	ADD R4,R4,R1
	LD R0,adress_a
	STR R4,R0,#1


	LD R0,SCOREA
	ADD R0,R0,#10
	ADD R0,R0,#15
	ADD R4,R3,#0
LOOP6	LDR R1,R2,#0
	STR R1,R5,#0
	ADD R6,R1,R0
	BRN COUNTC
	ADD R2,R2,#1
	ADD R5,R5,#1
	ADD R3,R3,#-1
	BRP LOOP6

COUNTC  NOT R1,R3
	ADD R1,R1,#1
	ADD R4,R4,R1
	LD R0,adress_a
	STR R4,R0,#2

	STR R3,R0,#3

LOOP7	LDR R1,R2,#0
	STR R1,R5,#0
	ADD R2,R2,#1
	ADD R5,R5,#1
	ADD R3,R3,#-1
	BRP LOOP7

	LDR R1,R0,#0
	LD R2,max_a
	NOT R1,R1
	ADD R1,R1,#1
	ADD R1,R2,R1
	BRN SITUATION1
	
LOOP8	LDR R1,R0,#1
	LDR R3,R0,#0
	LD R2,max_b
	NOT R1,R1
	NOT R3,R3
	ADD R1,R1,#1
	ADD R3,R3,#1
	ADD R2,R2,R3	;R2 is max_b
	ADD R1,R2,R1
	BRN SITUATION2
LOOP9	HALT

SITUATION1	STR R2,R0,#0
		NOT R1,R1
		ADD R1,R1,#1
		LDR R2,R0,#1
		ADD R2,R1,R2
		STR R2,R0,#1
		BRNZP LOOP8 
	
SITUATION2	STR R2,R0,#1
		NOT R1,R1
		ADD R1,R1,#1
		LDR R2,R0,#2
		ADD R2,R1,R2
		STR R2,R0,#2	
		BRNZP LOOP9
	
counter .FILL x003C	
BEGIN1	.FILL x3200
BEGIN2 	.FILL x4000
SCOREA	.FILL xFFAB	; in decimal:-85
max_a	.FILL x0012	; in decimal:18
max_b	.FILL x001E	; in decimal:30
adress_a .FILL x4100

	.END