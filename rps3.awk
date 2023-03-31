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
        if(r&&s){ printf "RS";r--;s-- }
        while (s>1){ printf "SS";s-=2 }
        if(r>1){ printf "RR";r-=2}
        while (p>1){ printf "PP";p-=2 }
        while (s&&p){ printf "SP";s--;p--}
    }
    print ""
}
