#!/usr/bin/gawk -f
BEGIN { FIELDWIDTHS=2 }
FNR==1{next}
func fight(m) {
    if(m~/R/&&m!~/P/){return "R"}
    if(m~/S/&&m!~/R/){return "S"}
    if(m~/P/&&m!~/S/){return "P"}
}
func t(m) {
    r=int(length(m)/2)
    o=""
    i=0
    while(r--) 
        o=(o fight(substr(m,1+i++*2,2)))
    return o
}
1
{r=t(t($0))}
r!~/R/{print $0}