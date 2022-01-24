#!/bin/sh
SOURCE_PATH="jar_files/"
DES_PATH_ES="/usr/share/elasticsearch/lib/"
for jar in $(find $DES_PATH_ES -name "log4j*.jar" ); 
do
#echo -------------$jar-------------------
A=$(echo $jar | cut -d "." -f 2)
C=15
#echo $A
if echo "$A" | grep -qE '^[0-9]+$'; then
    if [ $A -eq $C ] || [ $A -gt $C ] 
        then
            print "no change...."
        else
	    C1=$(echo $jar | cut -d "/" -f 6)
	    #print $C1
	    rm -rf $DES_PATH_ES$C1
	    cp $SOURCE_PATH$C1 $DES_PATH_ES
    fi
#print $DES_PATH_ES/$C2
else
    #echo "Error: not a number."
    B=$(echo $jar | cut -d "." -f 3)
    #echo $B
    if [ $B -eq $C ] || [ $B -gt $C ] 
        then
	   print "no change ....."
	else
	   C2=$(echo $jar | cut -d "/" -f 6)
	   #print $C2
	   rm -rf $DES_PATH_ES$C2
	   cp $SOURCE_PATH$C2 $DES_PATH_ES
    fi  
fi


#chmod 644 $DES_PATH_ES/log4j*
#systemctl restart  elasticsearch
#jar -tf $jar | grep TheNameOfTheClassImLookingFor
done
chmod 644 $DES_PATH_ES/log4j*
systemctl restart  elasticsearch

