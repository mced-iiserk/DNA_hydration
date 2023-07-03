The bend directory contains a tcl script for computing DNA bending.

##Prerequisite: VMD

##Input file needed: trajectory file (*.dcd), structure (*.pdb) and parameter file (*.psf) [for namd]

##Command to run the script:
vmd -dispdev text -e bend.tcl

-----------------------------------------------------------------------------------------------------------
The pair_entropy directory contains a tcl script for pair-entropy calculation. 

##Prerequisite: VMD

##Input files needed: reference .PDB file and output of RDF calculated using VMD

##Command to run the script:
vmd -dispdev text -e pair_correlation_entropy.tcl

-----------------------------------------------------------------------------------------------------------
The nuc_persistance directory contains a python script to calculate structural persistence of DNA backbone. 

##Prerequisite: MDAnalysis, numpy

##Input file needed: trajectory file (*.dcd), structure (*.pdb) and parameter file (*.psf) [for namd]

##Command to run the script:
vmd -dispdev text -e bend.tcl

-----------------------------------------------------------------------------------------------------------
