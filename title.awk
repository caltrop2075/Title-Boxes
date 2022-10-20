#!/usr/bin/awk -f
#------------------------------------------------------------------------------#
#                            Programmed By Liz                                 #
#------------------------------------------------------------------------------#
#==============================================================#
# script: title.awk                                            #
#   desc: boxes like program                                   #
#    use:                                                      #
#       cat file | title.awk                      defaults     #
#       cat file | title.awk -v t="shell"         type shell   #
#       cat file | title.awk -v t="line"          type shell   #
#       cat file | title.awk -v j="c"             just center  #
#       cat file | title.awk -v j="r"             just right   #
#                                                              #
#  type: c, c-, c=, c/, c/-, c/=, shell, shell-, shell=,       #
#        block, line, double, <default ascii>                  #
#  just: c, r, <default left>                                  #
#==============================================================#
BEGIN {
   switch(t)                              # set line type
   {
      case "c" :                          # c language
         lt="/*";mt="*";rt="*/"
         lm="/*";       rm="*/"
         lb="/*";mb="*";rb="*/"
         break
      case "c-" :
         lt="/*";mt="-";rt="*/"
         lm="/*";       rm="*/"
         lb="/*";mb="-";rb="*/"
         break
      case "c=" :
         lt="/*";mt="=";rt="*/"
         lm="/*";       rm="*/"
         lb="/*";mb="=";rb="*/"
         break
      case "c/" :
         lt="//";mt="/";rt="//"
         lm="//";       rm="//"
         lb="//";mb="/";rb="//"
         break
      case "c/-" :
         lt="//";mt="-";rt="//"
         lm="//";       rm="//"
         lb="//";mb="-";rb="//"
         break
      case "c/=" :
         lt="//";mt="=";rt="//"
         lm="//";       rm="//"
         lb="//";mb="=";rb="//"
         break
      case "sh" :                         # bash shell
         lt="#";mt="#";rt="#"
         lm="#";       rm="#"
         lb="#";mb="#";rb="#"
         break
      case "sh-" :
         lt="#";mt="-";rt="#"
         lm="#";       rm="#"
         lb="#";mb="-";rb="#"
         break
      case "sh=" :
         lt="#";mt="=";rt="#"
         lm="#";       rm="#"
         lb="#";mb="=";rb="#"
         break
      case "block1" :                      # block
         lt="░░";mt="░";rt=lt
         lm=lt;       rm=lt
         lb=lt;mb=mt;rb=lt
         break
      case "block2" :
         lt="▒▒";mt="▒";rt=lt
         lm=lt;       rm=lt
         lb=lt;mb=mt;rb=lt
         break
      case "block3" :
         lt="▓▓";mt="▓";rt=lt
         lm=lt;       rm=lt
         lb=lt;mb=mt;rb=lt
         break
      case "block4" :
         lt="██";mt="█";rt=lt
         lm=lt;       rm=lt
         lb=lt;mb=mt;rb=lt
         break
      case "wide" :                       # wide line
         lt="▐▛";mt="▀";rt="▜▌"
         lm="▐▌";       rm="▐▌"
         lb="▐▙";mb="▄";rb="▟▌"
         break
      case "line" :
         lt="┌";mt="─";rt="┐"             # line
         lm="│";       rm="│"
         lb="└";mb="─";rb="┘"
         break
      case "double" :                     # double line
         lt="╔";mt="═";rt="╗"
         lm="║";       rm="║"
         lb="╚";mb="═";rb="╝"
         break
#         lt=" =";mt="=";rt="="
#         lm="||";       rm="||"
#         lb=" =";mb="=";rb="="
      default :
         lt="+";mt="-";rt="+"
         lm="|";       rm="|"
         lb="+";mb="-";rb="+"
   }
   l=0
}
# ------------------------------------------------------------------------------
{                                         # analyze records
   ary[NR]=$0
   q=length($0)
   if(q>l)
      l=q
}
# ------------------------------------------------------------------------------
END {                                     # print records
   if(NR>0)
      line(lt,mt,rt)
      for(i=1;i<=NR;i++)
         switch(j)
         {
            case "c" :
               m=length(ary[i])
               n=int((l-m)/2)
               o=l-(m+n)
               printf("%s %"n"s%s%"o"s %s\n",lm,"",ary[i],"",rm)
               break
            case "r" :
               printf("%s %"l"s %s\n",lm,ary[i],rm)
               break
            default :
               printf("%s %-"l"s %s\n",lm,ary[i],rm)
         }
      line(lb,mb,rb)
}
# ------------------------------------------------------------------------------
function line(a,b,c)                      # print top/bot lines
{
   printf("%s",a)
   for(d=0;d<(l+2);d++)
      printf("%s",b)
   printf("%s\n",c)
}
