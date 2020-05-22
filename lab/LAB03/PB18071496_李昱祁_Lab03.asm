	.ORIG x3000
loop	NOT R2,R1
	ADD R2,R2,#1
	ADD R2,R0,R2	;calculate R0-R1
	BRN Lable
	BRZ end
	ADD R0,R2,#0
	BRNZP loop
Lable	NOT R2,R2
	ADD R1,R2,#1
	BRNZP loop
end	HALT	
	.END