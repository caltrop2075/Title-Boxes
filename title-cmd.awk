#!/usr/bin/awk -f
#------------------------------------------------------------------------------#
#                            Programmed By Liz                                 #
#------------------------------------------------------------------------------#
# parse title.sh command line
# builds command line string

BEGIN {
}
# ------------------------------------------------------------------------------
{
   for(i=1;i<=NF;i++)                     # parse command line
   {
      # printf("%02d:%s\n",i,$i)
      switch($i)
      {
         case "-j" :                      # justification
            i++
            j=$i
            break
         case "-t" :                      # box type
            i++
            t=$i
            break
         default :                        # alternate data file
            f=$i
      }
   }
}
# ------------------------------------------------------------------------------
END {                                     # build command
   if(f=="")                              # default data file
      f="~/data/title.dat"
   printf("cat %s | title.awk",f)
   if(j!="")                              # justification
      printf(" -v j=\"%s\"",j)
   if(t!="")                              # box type
      printf(" -v t=\"%s\"",t)
   printf("\n")
}
# ------------------------------------------------------------------------------
