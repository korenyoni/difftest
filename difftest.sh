#!/bin/bash

#DEFAULT VALUES
test_number_digit_limit=1
#this is needed because for example q61.in is the first input
#for question 6, not the single input for question 61
dir="./testcases"
file_prefix="q"
last_program_name=""

#Ticks
test_number=1
number_failed=0
number_passed=0
number_tests=0

#handle options
while getopts :d:p:l: FLAG; do
    case $FLAG in
        d) #set testcase directory
            dir=$OPTARG
            ;;
        p) #set filename prefix
            file_prefix=$OPTARG
            ;;
        l) #set test number digit limit
            test_number_digit_limit=$OPTARG
            ;;
    esac
done

function test_program {
    input_file=$1
    correct_out_file=$2
    program_name=$3
    tested_out=$(./$program_name < $input_file)
    diff_result=$(diff "$correct_out_file" - <<< "$tested_out")
    #increment test_number or reset it
    if [[ $last_program_name != $program_name ]]; then
        test_number=1
    else
        test_number=$(($test_number + 1))
    fi
    #pass or fail diff
    if [[ ${#diff_result} = 0 ]]; then
        echo "Passed $program_name test #$test_number"
        number_passed=$(($number_passed + 1))
    else
        echo "Failed $program_name test #$test_number:"
        diff "$correct_out_file" - <<< "$tested_out"
        number_failed=$(($number_failed + 1))
    fi
    last_program_name=$program_name
}

for f in "$dir"/*; do
    if [[ $f =~ \.in$ ]] && [[ $f =~ $file_prefix.*$ ]]; then
        input_file=$f
        input_file_nodir=${input_file:$((${#dir} + 1))}
        correct_out_file="${input_file:0:$((${#input_file} - 3))}.out"
        program_name=${input_file_nodir:0:$((${#file_prefix} + $test_number_digit_limit))}
        if [[ -e $program_name ]]; then
            test_program $input_file $correct_out_file $program_name
        else
            echo "$program_name not found."
        fi
        number_tests=$(($number_tests + 1))
    fi
done

echo "RESULT:"
echo "Tests passed: $number_passed/$number_tests (failed: $number_failed, not found: $(($number_tests - $number_passed - $number_failed)))"
