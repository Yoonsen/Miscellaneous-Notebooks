 # -*- coding: latin-1 -*-
"""
	Script read the result of a batch parse, and print every sentence where the number of parses do not 
	agree with the grammaticality marker, so help you find where there are errors.

	Optional parameter: Any number N, will then also add any sentence with more than N parses to the 
	returned list. Used find setntences with spurious parses.

	Elias Aamot 04.04.11

"""
import sys

__filename__ = "../MinorTest/np-inter-test-out"

problem_list = []
treshold = 1e5
if len(sys.argv) > 1:
	treshold = int(sys.argv[1])
number_of_errors = 0
total_number = 0

with open(__filename__,'r') as f:
	for line in f:
		line = line.strip()
		if line is not "" and not ';' in line:
			total_number += 1
			split = line.split()
			ungrammatical = '*' in line
			if ungrammatical:
				if int(split[-2]) != 0:
					# If the sentence is ungrammatical and has more than 0 parses
					problem_list.append( line )
					number_of_errors += 1
			else:
				if int(split[-2]) == 0:
					# If the sentence is grammatical and has 0 parses
					problem_list.append( line )
					number_of_errors += 1
				elif int(split[-2]) > treshold:
					# If the sentence has more than N (=treshold) parses
					problem_list.append( line )
					number_of_errors += 1

for e in problem_list:
	print e
print number_of_errors, "/", total_number, "=", float(float(number_of_errors/float(total_number))*100), "% error"
