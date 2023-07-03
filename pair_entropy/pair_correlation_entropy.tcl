#rdf input file
set in [open sys_gofr.dat r]
set out1 [open out_pair_entropy.dat w]
mol new sys.pdb
#water number in the sytem
set N [[atomselect top "resname TIP3 and name OH2"] num]
set N1 [expr (1.0*$N)] 
#masure box volumn
set boxvol [measure minmax [atomselect top all]]
set vec [vecsub [lindex $boxvol 1] [lindex $boxvol 0]]
set V [expr ([lindex $vec 0] * [lindex $vec 1] * [lindex $vec 2])]
#measure density
set Rho [expr $N1/$V]
set pi 3.1415926535897931
# Boltzmann constant in units of kcal/mol/K :
set Kb 0.00198657
set file_data [split [read $in ] "\n"]
set len [llength $file_data]
for {set l 0} {$l < $len} {incr l} {
	set h1 [lindex $file_data $l]
	set r [lindex [lindex $file_data $l] 0]
        set gofr [lindex [lindex $file_data $l] 1]
	if {$h1 != "" && $gofr > 0.0 } {
		set r2 [expr ($r * $r)]
		set s2_s [expr ($r2 * (($gofr*log($gofr)) - ($gofr -1)))]
		set s2 [expr  (((-2)*$pi*$Rho*$s2_s)*($Kb*$N1))]
		puts $out1 "$r $s2"

			}
		
	}
	
	
close $in
close $out1

exit
