maxIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0: heap memory pointer to actual  location of the record stock name in the file buffer

	#if empty file, return 0 for both a0, a1
	bnez a1, maxIncome_fileNotEmpty
	li a0, 0
	ret

 maxIncome_fileNotEmpty:
	
	# Start your coding from here!

	#li a0, 0x10040010
	#if no student code entered, a0 just returns 0x10040010 always :(
	addi s11,a0,4 # first row digit # keep saving first row digit addr 
	addi s6,zero,0 #s6 to contain max
	addi a0,s11,0 # a0= s11 
	
	jal income_from_record
	
	addi s6,a0,0 # assume first is the max 
	addi s11,s11,8 # next digit address
	addi a0,s11,0
	addi a1,a1,-2 # one record is added
	
	findMax_loop:
	
	jal income_from_record # return income in a0
	
	
	#record_ret:
	bgtu a0,s6,set_max
	
	max_set:
	addi s11,s11,8 # next digit address
	addi a0,s11,0
	addi a1,a1,-1 # one record is added 
	bnez a1,findMax_loop 
	# put accumulation result in a0 
	add a0,s3,zero
	j return_maxIncome
# End your  coding  here!
	set_max:
		addi s6,a0,0
		addi s3,s11,0
		addi s3,s3,-4
		j max_set
	#ret
	
#######################end of maxIncome###############################################
