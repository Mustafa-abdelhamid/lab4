length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here

li a0, 0
#if no student code provided, this function just returns 0 in a0
L1:
lw t2,0(a1) # load 
beqz t2,L2
addi a0,a0,4 #count one 4 bytes
addi a1,a1,4
j L1

#End your coding here
L2:
	# now we need to check if last 4 bytes doesn't have NULL
	lw t2,-4(a1)
	addi a5,zero,255 # a5 is the used byte mask 
	
	slli a5,a5,8 #a5 = 00_00_FF_00
	and a4,t2,a5 # a4 is the one byte of t2
	beqz a4,sub_3
	
	slli a5,a5,8
	and a4,t2,a5 # a4 is the one byte of t2
	beqz a4,sub_2

	slli a5,a5,8
	and a4,t2,a5 # a4 is the one byte of t2
	beqz a4,sub_1
	j end	
	
sub_3:
	addi a0,a0,-3
	j end
sub_2:
	addi a0,a0,-2
	j end
sub_1:
	addi a0,a0,-1
	j end
end:	
	ret
#######################end of length_of_file###############################################	
