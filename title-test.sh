#!/usr/bin/bash
#------------------------------------------------------------------------------#
#                            Programmed By Liz                                 #
#------------------------------------------------------------------------------#
# a test of title-80.sh & title.sh
clear

msg="test\nthis and that"

title-80.sh "<default>\n$msg"

for typ in line double wide block1 block2 block3 block4 c c- c= c/ c/- c/= sh sh- sh=
do
   title-80.sh -t $typ "-t $typ\n$msg"
done

echo -e "<default>\n$msg" > ~/data/title.dat
title.sh
for jst in c r
do
   echo -e "-j $jst -t line\n$msg" > ~/data/title.dat
   title.sh -j $jst -t line
done
