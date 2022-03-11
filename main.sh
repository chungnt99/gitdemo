#! /bin/bash

> result.txt
echo "Name, Role, Department" > result.txt
> employees.txt
file=$1 #input file

name=()
role=()
department=()
grep -i "tsdv" $file > employees.txt #tim kiem khong phan biet hoa thuong
sed -i -e 's/ //g' employees.txt
while read line
do
    line=${line,,} #chuyen thanh chu thuong 
    line=$(echo "$line" | cut -d ',' -f 2-4 ) #loai bo stt
    name+=($(echo "$line" | cut -d ',' -f 1)) #lay danh sach name
    role+=($(echo "$line" | cut -d ',' -f 2)) #lay danh sach role
    department+=($(echo "$line" | cut -d ',' -f 3)) #lay danh sach department

    # if [[ $role ]]
    numb=$((${#role[@]}-1))
    if [[ "${role[$numb]}" == "leader" ]]
    then
        echo "Leader name: ${name[$numb]}"
        echo $line | sed -e "s/${name[$numb]}/QuanTV/" >> result.txt
    else
        echo $line >> result.txt
    fi
done < employees.txt

# echo "Name, Role, Department" > result.txt
# for (( i=0;i<${#name[@]};i++ ))
# do  
#     if [ "${role[i]}" == "leader" ]
#     then
#         leader_name=$(echo ${name[i]} | sed -e "s/${name[i]}/QuanTV/") #doi ten
#         echo "$leader_name, ${role[i]}, ${department[i]}" >> result.txt #write to file
#     else
#         echo "${name[i]}, ${role[i]}, ${department[i]}" >> result.txt #write to file
#     fi
# done
awk '!seen[$0]++' result.txt > 'uniq_result.txt' #loai bo employees trung

#run
#step1: chmod +x ./main.sh
#step2: bash main.sh
#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
