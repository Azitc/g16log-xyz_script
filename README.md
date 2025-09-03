# g16log-xyz_script
A script that convert Gaussian 16 log file to molden format xyz file<br />
To use, just `source log-xyz.sh logname.log`<br />
The description of how it works is also in the comments in the script <br /><br />
## How this chain of things work
cat the log | grep the lines n=natoms before the word Version, I made it scale with Natom it shouldnt cause problem if below 1000 atoms | 
sed to get only the line between 1\1\GINC and Version | tr to join all line together | turn every \ to a new line | 
remove line 1-16 (THIS WILL BREAK IF TITLE CONTAIN "`\`" ) | head to get only the natoms amount of line | awk to turn it to nice column | 
sed to write SCF energy | sed to write number of atoms to file <br />
If something breaks here good luck <br /><br />
If you want to change how the thing comes out just modify the last > ${logname}.xyz to whatever you want
If you need just the pure xyz coordinates the last 2 sed can be removed but this will no longer be molden format (useful when piping to .com or .inp files)

If the tab spaces are unsightly change it to space (The file is still completely usable just ugly) <br />
In vim :`:%s/\s\+/ /g` <br />
using sed: `sed -e 's/[[:space:]]/\ /g' filename.xyz` <br />
This replaces all tab space with space 
