 # -*- coding: latin-1 -*-

det_list = ["en", "ei", "et", "den", "det", "de", "flere", ""]
#adj_list = ["liten", "lita", "lite", "lille", "små", ""]
adj_list = ["snill", "snilt", "snille", ""]
n_list = ["gutt", "jente", "barn", "gutten", "jenta", "barnet", "gutter", "guttene", "jenter", "jentene", "barnene", ""]

with open("np-intern-test",'w') as f:
	for d in det_list:
		for a in adj_list:
			for n in n_list:
				string = ""
				if d != "":
					string += d + " "
				if a != "":
					string += a + " "
				if n != "":
					string += n + " "
				string += "sover\n"
				f.write(string)

