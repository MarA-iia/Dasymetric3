#!/bin/bash


function creare_formula_sql()
{

 input=$1
 

# name_field="code_2018"

# classes=("Res" "Rural" "IndCommLei" "RoadsEt")

# Residential=("11100" "11210" "11220" "11230" "11240" "13400")
# IndCommLeisure=("12100" "14100" "14200")
# Rural=("21000" "22000" "23000" "24000" "32000" "33000")
# RoadsEtal=("12210" "12220" "12230" "12400")



name_field="code_2018"

# declaring array list and index iterator
declare -a array=()
i=0

# reading file in row mode, insert each line into array
while IFS= read -r line; do
    array[i]=$line
    let "i++"
    # reading from file path
done < $input

# for line in "${array[@]}"
#   do
#     echo "$line"
# done

cmd_assegn0=$(echo "${array[0]}")
eval $cmd_assegn0
cmd_assegn1=$(echo "${array[1]}")
eval $cmd_assegn1
cmd_assegn2=$(echo "${array[2]}")
eval $cmd_assegn2
cmd_assegn3=$(echo "${array[3]}")
eval $cmd_assegn3


# $(echo "${array[0]}")
# $(echo "${array[1]}")
# $(echo "${array[2]}")
# $(echo "${array[3]}")

# $(eval $(echo "${array[0]}"))
# $(eval $(echo "${array[1]}"))
# $(eval $(echo "${array[2]}"))
# $(eval $(echo "${array[3]}"))

VAR="'CASE"

for str1 in ${Residential[@]}; do
#   echo $str1
#   echo \\r\\nWHEN \\\"$name_field\\\"=\\\'$str1\\\' THEN \\\'Res\\\' 
  ELEMENT=$(echo \\r\\nWHEN \\\"$name_field\\\"=\\\'$str1\\\' THEN \\\'Res\\\')
  VAR+="${ELEMENT} "
done

# echo ""
# echo ""
# echo ""
# echo "$VAR"
# echo ""
# echo ""
# echo ""

for str2 in ${IndCommLeisure[@]}; do
#   echo $str2
#   echo \\r\\nWHEN \\\"$name_field\\\"=\\\'$str2\\\' THEN \\\'IndCommLei\\\' 
  ELEMENT2=$(echo \\r\\nWHEN \\\"$name_field\\\"=\\\'$str2\\\' THEN \\\'IndCommLei\\\')
  VAR+="${ELEMENT2} "
done

# echo ""
# echo ""
# echo ""
# echo "$VAR"
# echo ""
# echo ""
# echo ""
for str3 in ${Rural[@]}; do
#   echo $str3
#   echo \\r\\nWHEN \\\"$name_field\\\"=\\\'$str3\\\' THEN \\\'Rural\\\' 
  ELEMENT3=$(echo \\r\\nWHEN \\\"$name_field\\\"=\\\'$str3\\\' THEN \\\'Rural\\\')
  VAR+="${ELEMENT3} "
done

# echo ""
# echo ""
# echo ""
# echo "$VAR"
# echo ""
# echo ""
# echo ""
for str4 in ${RoadsEtal[@]}; do
#   echo $str3
#   echo \\r\\nWHEN \\\"$name_field\\\"=\\\'$str4\\\' THEN \\\'RoadsEt\\\' 
  ELEMENT4=$(echo \\r\\nWHEN \\\"$name_field\\\"=\\\'$str4\\\' THEN \\\'RoadsEt\\\')
  VAR+="${ELEMENT4} "
done

# echo ""
# echo ""
# echo ""
# echo "$VAR"
# echo ""
# echo ""
# echo ""
VAR_end="\\r\\nELSE \\'Other\\'\\r\\nEND'"

# echo ""
# echo ""
# echo ""
# echo $VAR_end

VAR_Finale=$VAR$VAR_end

# echo ""
# echo ""
# echo ""
# echo "----------------Formula Finale------------------"
# echo ""
# echo ""
# echo ""
# echo $VAR_Finale

# echo ""
# echo ""
# echo ""
# echo "------------------------------------------------"


myformula=$VAR_Finale
# echo "$VAR_Finale"

}


creare_formula_sql parameters.txt
# echo $VAR_Finale