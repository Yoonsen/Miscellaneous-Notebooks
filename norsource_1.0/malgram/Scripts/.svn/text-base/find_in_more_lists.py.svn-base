"""
	Simple script to find a verb that occurs in two lists. EAA. 16-06-11.

	Because verbs sometimes occur with inf-marker, regard only the last element in line.

	Parameters: The (relative) paths of the two files
				-w : print to file
				-p : print to screen
"""
import sys

f1 = sys.argv[1]
f2 = sys.argv[2]

found1 = []
found2 = []

with open(f1, 'r') as f:
	for l in f:
		l = l.strip()
		if l != "":
			w = l.split()[-1]
			found1.append(w)

with open(f2, 'r') as f:
	for l in f:
		l = l.strip()
		if l != "":
			w = l.split()[-1]
			if w in found1 and not w in found2:
				found2.append(w)
if "-p" in sys.argv:
	for e in sorted(found2):
		print e
	print len(found2)
if "-w" in sys.argv:
	with open("found.txt", 'w') as f:
		for e in sorted(found2):
			f.write(e + "\n")
