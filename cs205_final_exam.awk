# TODO: Modify this file to create a shell script that is able to use awk to go through a file
# formatted like pokemon.dat and provides a printed report in the following format (where your 
# script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    Total Non-Legendary Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Defense: [VALUE]
# ======= END SUMMARY =======

# NOTE THAT YOU MUST USE AWK OR YOU WILL LOSE POINTS
# The "Avg." values should be calculated as mean values for the corresponding columns.
# The averages must only be for non-legendary pokemon.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not
# necessarily be called pokemon.dat. However, you can assume that any file passed to this
# script will be formatted exactly the way pokemon.dat is formatted.

BEGIN{FS="\t"}
{
	#basically says if the line isn't the first line then...
	if(NR!=1){
		#need to check if the pokemon is legendary
		#it looks like the value here is true or false
		#in awk any nonzero value is true other wise it's false
		#otherwise it doesn't matter
		#check for legendary if it is I'll track how many are legendary but we don't care
		#This seems like a redundant check since I could just do the oppisite here but I initially thought 
		#We needed to know the number of legendary pokemon
		if(tolower($13)=="true"){
			total_legendary+=1
		}
		else{
			#if the pokemon isn't legendary then we want to add their vals
			#to the other two vars
			num_pokemon+=1
			avg_hp+=$6
			avg_def+=$8


		}

	}


}
END{
	#Now I just print out everything
	printf "======== SUMMARY OF POKEMON.DAT =========\n"
	printf "Total Non-Legendary Pokemon: "
	print num_pokemon
	printf "\n"
	printf "Avg. HP: "
	print avg_hp/num_pokemon
	print "\n"
	printf "Avg. Defense: "
	print avg_def/num_pokemon
	printf "\n"
	printf "======== END OF SUMMARY ==========\n"
}
