#!/bin/bash
logname=${1%%.*}
natoms=`grep NAtoms $1 |head -1 |awk '{print $2}'`
scfenergy=$(grep "SCF Done" ${1}|awk '{print $5}'| tail -n 1)

cat ${logname}.log | grep -i -B $natoms 'Version' | sed -n '/1\\1\\GINC/,/Version/p' | tr -d '[:space:]' | sed 's/\\/\n/g' | sed '1,16d' | head --lines=$natoms | awk -F, 'BEGIN{ OFS="\t" } { $1=$1; print }' | sed "1 i\SCF Done: $scfenergy" | sed '1 i\'"$natoms"'' > ${logname}.xyz

#how this chain of things work
#cat the log | grep the lines n=natoms before the word Version, I made it scale with Natom it shouldnt cause problem if below 1000 atoms 
#sed to get only the line between 1\1\GINC and Version | tr to join all line together | turn every \ to a new line | 
#remove line 1-16 (THIS WILL BREAK IF TITLE CONTAIN "\" ) | head to get only the natoms amount of line | awk to turn it to nice column
#sed to write SCF energy | sed to write number of atoms to file
#If something breaks here good luck

#If you want to change how the thing comes out just modify the last > ${logname}.xyz to whatever you want
#If you need just the pure xyz coordinates the last 2 sed can be removed
