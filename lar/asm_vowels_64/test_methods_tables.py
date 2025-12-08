# Generate tables
import math, sys, os, argparse
import numpy as np
import pandas as pd

recent_processors="AMD-Ryzen-7-1700X-Eight-Core-Processor Intel-Core-i5-7400-3_00GHz Intel-Core-i7-8700-3_20GHz AMD-Ryzen-5-3600-6-Core-Processor Intel-Xeon-Silver-4208-2_10GHz"
ancien_processors="Intel-Core2-Quad-Q6600-2_40GHz AMD-Phenom-II-X6-1090T-Processor Intel-Core-i5-3570K-3_40GHz Intel-Core-i7-4790-3_60GHz"

methods=[x for x in range(1,23) ]
print(methods)

def generate(output_file_name, processors, procs):
	global methods
	
	list_procs = processors.split(' ')
	nbr_procs = len(list_procs)
	nbr_methods = len(methods)
	
	
	data = np.zeros(nbr_methods*nbr_procs).reshape(nbr_methods, nbr_procs)
	
	for processor in list_procs:
		input_file_name = "results/" + processor + "/test_methods.txt"
		c = list_procs.index(processor)
		print("c=", c)
		if os.path.exists(input_file_name):
			times = pd.read_csv(input_file_name, sep='\s+')
			print(times.head())
			for method in methods:
				v = times.time[ method-1 ]
				data[method-1, c] = v
	
	print(data)
	
	contents = '\\begin{table}\n'
	contents = contents + '\\begin{tabular}{l'
	for i in range(nbr_procs):
		contents += 'r'
	contents = contents + '}\n'
	
	# Marque / Brand
	contents += "\\Theadertoprule\n"
	contents += "\\Thdf{Marque} "
	for processor in list_procs:
		c = procs.index[ procs['name'] == processor].tolist()[0]
		#print("c=", c, procs.brand[c], processor)
		contents += " & \\Thfd{" + procs.brand[c] + "}"
	contents += "\\\\\n"
	
	# Modèle / Model
	contents += "\\Theadertoprulecontinue\n"
	contents += "\\Thdf{Modèle} "
	for processor in list_procs:
		c = procs.index[ procs['name'] == processor].tolist()[0]
		#print("c=", c, procs.model[c], processor)
		contents += " & \\Thfd{" + procs.model[c] + "}"
	contents += "\\\\\n"
	
	# Sous Modèle / SubModel
	contents += "\\Theadertoprulecontinue\n"
	contents += "\\Thdf{Sous Modèle} "
	for processor in list_procs:
		c = procs.index[ procs['name'] == processor].tolist()[0]
		#print("c=", c, procs.submodel[c], processor)
		contents += " & \\Thfd{" + procs.submodel[c] + "}"
	contents += "\\\\\n"
	
	contents += "\\Theaderbottomrule\n"
	
	for i in range(data.shape[0]):
		contents += "%2d" % (methods[i])
		contents += " & "
		for j in range(data.shape[1]):
			contents += "%6.2f" % (data[i,j])
			contents += ' & '
		contents += " \\\\\n"
	contents = contents + '\\end{tabular}\n'
	contents = contents + '\\end{table}\n'
	
	output = open(output_file_name, "w+") 
	output.write(contents)
	output.close()
	
	print(contents)
	
def main():
	try:
		os.mkdir("output")
	except:
		pass

	procs = pd.read_csv('processors.txt', sep='|', header=None, comment="#")
	print(procs.columns)
	procs.rename( columns = {
		0: 'name' ,
		1: 'brand',
		2: 'model',
		3: 'submodel',
		4: 'year'},
		inplace=True )
	
	print(procs.head())
	
	i = procs.index[ procs['name'] == 'AMD-Ryzen-7-1700X-Eight-Core-Processor'].tolist()
	print("i=", i)

	
	generate("output/recent.tex", recent_processors, procs)
	generate("output/ancien.tex", ancien_processors, procs)

if __name__ == "__main__":
    main()
	
