BEGIN {
    split(cols,out,",")
    FS = ","
    OFS = ","
}
NR==1 {
    {for (i=1; i<=NF; i++)
        ix[$i] = i}

     for (i in out)
        printf "%s%s", $ix[out[i]], OFS
     print ""

}
NR>1 {
    for (i in out)
        printf "%s%s", $ix[out[i]], OFS
    print ""
}