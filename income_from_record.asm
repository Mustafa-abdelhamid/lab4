income_from_record:
#function to return numerical income from a specific record
#e.g. for record "Microsoft,34\r\n", income to return is 34(for which name is Microsoft)

#arguments:	a0 contains pointer to start of numerical income in record 

#function RETURNS income numerical value of the asci income in a0 (34 in our example)
	
# Start your coding from here!

	#li a0, 0
	
	
	
	 
	
	
	#if no student code entered, a0 just returns 0 always :(
	addi a6,zero,0 # we will store updates of int in it
	addi a7,zero,48 #this for compraison to see if it is not int
	addi t2,zero,-1 # i willl use it in the program
	addi s5,zero,10
	addi t3,zero,3 # used to mask the remindar 
	addi t4,zero,4
	addi s7,zero,8
	
	
	
	
	
	lw s0,0(a0)   #read address from the heap
	
	and t3,t3,s0 # remindar
	slli s10,t2,2
	and s0,s0,s10  #address
	
	#s0=base address   t3=reminder
	
	
	j loop1
 cloop1:
 
 
 	addi a5,zero,0
 	
 	addi a5,t3,0
 	beqz a5,re0
 	
 	addi a5,t3,-1
 	beqz  a5,re1
 	
 	addi a5,t3,-2
 	beqz a5,re2
 	
 	addi a5,t3,-3
 	beqz  a5,re3
		
	
 	
 	
 	re0:
 		addi a5,a5,1
		addi a3,a3,-48
		mul  a6,a6,s5
		add  a6,a6,a3
	
	
	re1:
		addi a5,a5,1
		slli a4,a4,8
		and a3,a2,a4   #we have byte of digit
		srli  a3,a3,8
		blt  a3,a7,cloop2
		addi a3,a3,-48
		mul  a6,a6,s5
		add a6,a6,a3
		srli a4,a4,8
	
	re2:
		addi a5,a5,1
		slli a4,a4,16
		and a3,a2,a4   #we have byte of digit
		srli a3,a3,16
		blt  a3,a7,cloop2
		addi a3,a3,-48
		mul  a6,a6,s5
		add a6,a6,a3
		srli a4,a4,16
	
	re3:
		addi a5,a5,1
		slli a4,a4,24
		and a3,a2,a4   #we have byte of digit
		srli a3,a3,24
		blt  a3,a7,cloop2
		addi a3,a3,-48
		mul  a6,a6,s5
		add a6,a6,a3
		srli a4,a4,24
		

	
		
	addi s0,s0,4
	addi t3,zero,0
 	
loop1:
	lw a2,0(s0) #load for value pinted by pointer
	addi a4,zero,255  # a5 is the used byte mask 
	mul s8,t3,s7
	sll  s9,a4,s8
	and a3,a2,s9   #we have byte of digit
	srl a3,a3,s8
	bge a3,a7,cloop1

cloop2:
		addi a0,a6,0
	
	

	
	
	
	
# End your  coding  here!
	ret
	
#######################end of income_from_record###############################################	
