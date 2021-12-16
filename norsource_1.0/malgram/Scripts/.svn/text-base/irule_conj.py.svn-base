# -*- coding: iso-8859-15 -*-
"""
Simple and hacky python script that transfers the patterns of conjugation 
from a file to another with systematic changes. Used to store that the
strong verbs should react to the mal-i-rules in the same way as ordinary
i-rules. EAA 22-11-2010.
"""
# Declare the names of the files. Feel free to change the names as desired.
_input_file_ = "irregs.tab"
_output_file_ = "mal_irregs.irreg"
# Opens the files
in_file = open(_input_file_, "r")
out_file = open(_output_file_, "w")
# Read from one file and write to the other
string = in_file.readline()
while string != "":
	# If more changes are to be added, add them here, using the same pattern as below
	string1 = string.replace("pret-nonfstr_infl_rule","mal-past-inf-like-2_infl_rule")
	string2 = string1.replace("pret-finalstr_infl_rule","mal-past-inf-like-1_infl_rule")
	string3 = string2.replace("pret-finalstr_infl_rule","mal-past-inf-like-1_infl_rule")
	# Only store to file if a change has taken place
	if string != string3:
		out_file.write(string3)
	# Read next line
	string = in_file.readline()
# Close the files
in_file.close()
out_file.close()
