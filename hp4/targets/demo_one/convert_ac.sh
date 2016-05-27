#!/bin/bash

TEST_SUFFIX=

if [ $# -eq 1 ]
  then
    if [[ $1 == "--test" ]]; then
      TEST_SUFFIX="_test"
    fi
fi

~/hp4-src/tools/ac_to_c.py --input commands_annotated_d1_A_s1_s3.txt --output A_s1$TEST_SUFFIX.txt --progID 1
~/hp4-src/tools/ac_to_c.py --input commands_annotated_d1_A_s1_s3.txt --output A_s3$TEST_SUFFIX.txt --progID 1
~/hp4-src/tools/ac_to_c.py --input commands_annotated_d1_A_s2.txt --output A_s2$TEST_SUFFIX.txt --progID 1

~/hp4-src/tools/ac_to_c.py --input commands_annotated_d1_B_s1.txt --output B_s1$TEST_SUFFIX.txt --progID 2
~/hp4-src/tools/ac_to_c.py --input commands_annotated_d1_B_s2.txt --output B_s2$TEST_SUFFIX.txt --progID 2
~/hp4-src/tools/ac_to_c.py --input commands_annotated_d1_B_s3.txt --output B_s3$TEST_SUFFIX.txt --progID 2

~/hp4-src/tools/ac_to_c.py --input commands_annotated_d1_C_s2_1.txt --output C_s2_1$TEST_SUFFIX.txt --progID 3
~/hp4-src/tools/ac_to_c.py --input commands_annotated_d1_C_s2_2.txt --output C_s2_2$TEST_SUFFIX.txt --progID 4
~/hp4-src/tools/ac_to_c.py --input commands_annotated_d1_C_s2_3.txt --output C_s2_3$TEST_SUFFIX.txt --progID 5
