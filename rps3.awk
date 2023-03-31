#!/usr/bin/gawk -f
FNR==1{next}
!/R.*P.*S/{print "not supported";exit -1}
{   r=$1+0
    p=$2+0
    s=$3+0
    while(r&&p) {
        printf "PR";p--;r--
        if (r>1){ printf "RR";r-=2}
    }
    while(r||p||s) {
        if(!skipR&&r&&s){ printf "RS";r--;s-- ;skipR=1;have_scissors=1}
        while (s>1){ printf "SS";s-=2 ;have_scissors=1;skipR=1}
        if(!skipR&&r>1){ printf "RR";r-=2;skipR=1;continue}
        if (!skipR&&!have_scissors&&s>1){ printf "SS";s-=2 ;have_scissors=1}
        if (!skipR&&!have_scissors&&p){ printf "SP";s--;p--;have_scissors=1}
        while (p>1){ printf "PP";p-=2 }
        while (s&&p){ printf "SP";s--;p--}
        skipR=0
    }
    print ""
}
