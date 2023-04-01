#!/usr/bin/gawk -f
BEGIN{FPAT=".."}
{ n=0
    while(++n<=NF) {
        printf "%s ",$n
        if((n+1)%2)printf " "
    }
    print ""}
