	.ORIG x3000
loop	NOT R2,R1
	ADD R2,R2,#1
	ADD R2,R0,R2	;calculate R0-R1
	BRN Lable       ;if R0<R1 , go to “Lable” (to assign R1 = R1 - R0);
	BRZ end         ;if R1==R0 ,the integer in R0 is the 
	ADD R0,R2,#0    ;Neither of the above is true,which means R0>R1.then assign R0 = R0 - R1.
	BRNZP loop
Lable	NOT R2,R2   
	ADD R1,R2,#1    ;assign R1 = R1 - R0
	BRNZP loop      ;Continue the circulation
end	HALT
	.END