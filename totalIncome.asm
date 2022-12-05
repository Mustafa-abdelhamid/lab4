totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty
	li a0, 0
	ret

totalIncome_fileNotEmpty:
	
	# Start your coding from here!
	addi s11,a0,4 # first row digit # keep saving first row digit addr 
	addi s6,zero,0 # zeroing s6 before summation start 
	addi a0,s11,0 # a0= s11 
	add_loop:
	jal income_from_record # return income in a0
	
	
	#record_ret:
	add s6,s6,a0 # accumulate
	addi s11,s11,8 # next digit address
	addi a0,s11,0
	addi a1,a1,-1 # one record is added 
	bnez a1,add_loop 
	# put accumulation result in a0 
	add a0,s6,zero
	
	#if no student code entered, a0 just returns 0 always :(
	
# End your  coding  here!
	
	#ret
	j return_totalIncome
#######################end of nameOfMaxIncome_totalIncome###############################################
