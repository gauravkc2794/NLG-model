#!/bin/sh

dataPointsChosen=$(shuf -i 2-42064 -n 1000 | sort -n)
COUNT=0
IND=0;
#echo $dataPointsChosen
while IFS= read -r line
do
  COUNT=$(( $COUNT + 1 ))
  LOCALIND=0
  for item in $dataPointsChosen
  do
    	if [[ "$COUNT" == "$item" &&  "$IND" -le  "$LOCALIND" ]]; then
        	#echo "$item", "$LOCALIND"
		newline=$line
		if [[ "$line" == *"Japanese"* ]]; then
			str1="Japanese"
			str2="English"
			newline=${line//$str1/$str2}
		fi
		if [[ "$line" == *"English"* ]]; then
			str1="English"
			str2="French"
			newline=${line//$str1/$str2}
		fi
		if [[ "$line" == *"Italian"* ]]; then
			str1="Italian"
			str2="Chinese"
			newline=${line//$str1/$str2}
		fi
		if [[ "$line" == *"French"* ]]; then
			str1="French"
			str2="Indian"
			newline=${line//$str1/$str2}
		fi
		if [[ "$line" == *"Indian"* ]]; then
			str2="Japanese"
			str1="Indian"
			newline=${line//$str1/$str2}
		fi

		if [[ "$line" == *"1"* ]]; then	
			str2="5"
			str1="1"
			newline=${newline//$str1/$str2}
		fi
		if [[ "$line" == *"2"* ]]; then	
			str2="4"
			str1="2"
			newline=${newline//$str1/$str2}
		fi
		if [[ "$line" == *"3"* ]]; then	
			str2="2"
			str1="3"
			newline=${newline//$str1/$str2}
		fi
		if [[ "$line" == *"4"* ]]; then	
			str2="1"
			str1="4"
			newline=${newline//$str1/$str2}
		fi
		
		if [[ "$line" == *"average"* ]]; then	
			str1="average"
			str2="high"
			newline=${newline//$str1/$str2}
		fi
		
		if [[ "$line" == *"cheap"* ]]; then	
			str1="cheap"
			str2="moderate"
			newline=${newline//$str1/$str2}
		fi
		if [[ "$line" == *"moderate"* ]]; then	
			str1="moderate"
			str2="high"
			newline=${newline//$str1/$str2}
		fi
		if [[ "$line" == *"high"* ]]; then	
			str2="cheap"
			str1="high"
			newline=${newline//$str1/$str2}
		fi
		
		if [[ "$line" == *"yes"* ]]; then	
			str1="yes"
			str2="no"
			newline=${newline//$str1/$str2}
			str1="family friendly"
			str2="not family friendly"
			newline=${newline//$str1/$str2}
			str1="child friendly"
			str2="not child friendly"
			newline=${newline//$str1/$str2}
			str1="kid friendly"
			str2="not kid friendly"
			newline=${newline//$str1/$str2}
		fi
		if [[ "$line" == *"no"* ]]; then	
			str2="yes"
			str1="no"
			newline=${newline//$str1/$str2}
			str1="not"
			str2=""
			newline=${newline//$str1/$str2}
		fi
	
		#echo $newline
		echo $line
		echo $newline
		#echo "\n"	
		echo $newline >> data/trainset.csv-new
		IND=$LOCALIND
        	break
    	fi
	LOCALIND=$(( $LOCALIND + 1 ))
  done
done < data/trainset.csv
