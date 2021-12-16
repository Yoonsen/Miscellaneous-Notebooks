"""
	Script to run through a verb-lexicon and build a subcat-frame-list-dictionary. EAA. 14-06-11

	Optional paramterers:
		-P : prints the subcats lists of all verbs
		-p : prints the subcats lists of the verbs given as following arguments
		-f : prints all elements that have in their list all the terms following -f
		-F : prints all elements that have in their list at least on of the terms following -F
		-n : prints all elements that have in their list the element following -n  but not the rest
		-w : writes the output of the search to the ile "output.txt"
"""
import sys

subcat_dict = dict()
found = []

def read_file(f):
	global subcat_dict
	for line in f:
		line = line.strip().split()
		if ":=" in line:
			verb_name = line[0].split('_')[0]
			if line[2].startswith("v-"):
				if verb_name in subcat_dict:
					subcat_dict[verb_name].append(line[2])
				else:
					subcat_dict[verb_name] = [ line[2] ]

with open("../../lex4.v-lrg.tdl", "r") as f:
	read_file(f)
#with open("../../lex2.open.tdl", "r") as f:
#	read_file(f)
#with open("../../lex1.close.tdl", "r") as f:
#	read_file(f)

if "-p" in sys.argv:
	ks = sys.argv[sys.argv.index("-p")+1:]
	for k in sorted(ks):
		print k, ":", subcat_dict[k]

if "-P" in sys.argv:
	for k in sorted(subcat_dict):
		print k, ":", subcat_dict[k]

if "-f" in sys.argv:
	searchlist = sys.argv[sys.argv.index("-f")+1:]
	for k in subcat_dict:
		if not (False in [e in subcat_dict[k] for e in searchlist]):
			found.append(k)
	if not "-w" in sys.argv:
		for s in sorted(found):
			print s

if "-F" in sys.argv:
	searchlist = sys.argv[sys.argv.index("-F")+1:]
	for k in subcat_dict:
		if True in [e in subcat_dict[k] for e in searchlist]:
			found.append(k)
	if not "-w" in sys.argv:
		for s in sorted(found):
			print s

if "-n" in sys.argv:
	true = sys.argv[sys.argv.index("-n")+1]
	false_list = sys.argv[sys.argv.index("-n")+2:]
	for k in subcat_dict:
		if true in subcat_dict[k] and not True in [e in subcat_dict[k] for e in false_list]:
			found.append(k)
	if not "-w" in sys.argv:
		for s in sorted(found):
			print s

if "-w" in sys.argv:
	with open("test.txt", "w") as f:
		for s in sorted(found):
			f.write(s + "\n")
