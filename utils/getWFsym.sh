#!/bin/bash

for f in `ls *.rxyz`
do
	echo ""
	echo $f
	
	nAtoms=`head -n1 $f`
	labelBase=`echo $f | sed 's/.*\///g' | sed 's/-.*$//g'`
	
	list=`find ../../ -name "${f%%.*}.*.out"`
	
	cat /dev/null > .grpwf

	for out in $list
	do
		echo "$nAtoms" > mmm.xyz
		echo "" >> mmm.xyz
		
		grep -A$(( $nAtoms+4 )) "Input orientation:" $out | tail -n $nAtoms \
			| awk  '
				{
					if($2==6) sym="C"
					if($2==1) sym="H"
					if($2==9) sym="F"
					printf "%5s%12.6f%12.6f%12.6f\n", sym, $4,$5,$6
				}' >> mmm.xyz
				
		label=`echo $out | sed 's/.*\///g' | sed 's/-.*$//g'`
			
		if [ "$label" = "$labelBase" -a "`molecule.compare $f mmm.xyz | grep OK | wc -l`" -eq 3 ]
		then
			grp=`grep "Full point group" $out | awk '{print $4}'`
			wf=`grep "The electronic state is" $out | awk '{print $5}' | sed 's/[.]//g'`; echo "     $out"
			
			[ -n "$grp" ] &&  echo "$grp $wf" >> .grpwf
		fi

		rm mmm.xyz
	done

	awk '{if(length($2)>0) map[$1]=$2; else map[$1]="--"}END{for(key in map) print "\nSYMMETRY",key; print "ELECTRONIC_STATE",map[key]}' .grpwf
	awk '{if(length($2)>0) map[$1]=$2; else map[$1]="--"}END{for(key in map) print "\nSYMMETRY",key; print "ELECTRONIC_STATE",map[key]}' .grpwf >> $f

	rm .grpwf
done

