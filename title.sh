#!/usr/bin/bash
#------------------------------------------------------------------------------#
#                            Programmed By Liz                                 #
#------------------------------------------------------------------------------#
# prints ~/data/title.dat -or- alt file with border

source ~/data/global.dat

out=~/data/title.dat

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]
then
   echo "       usage: title.sh -j c/r -t type [alt-file]" > $out
   echo "default just: <left>" >> $out
   echo "        type: <default ascii>, line, double, wide" >> $out
   echo "              block1, block2, block3, block4" >> $out
   echo "              comment: c,  c-,  c=," >> $out
   echo "                       c/, c/-, c/=," >> $out
   echo "                       sh, sh-, sh=," >> $out
   echo "default file: ~/data/title.dat" >> $out
   echo "        note: all switches are optional" >> $out
   title.sh
else
   cmd=$(echo $* | title-cmd.awk)                                 # cmd lin par
   # echo $cmd
   eval $cmd
fi
