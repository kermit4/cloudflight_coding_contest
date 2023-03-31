#!/usr/bin/gawk -f
FNR==1{next}
/R/&&!/P/{print "R"}
/S/&&!/R/{print "S"}
/P/&&!/S/{print "P"}
