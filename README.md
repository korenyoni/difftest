#difftest

A bash utility for testing programs using sets of inputs and expected outputs.

For a program with respective files:

`<prefix><program_number><test_number>.in`
`<prefix><program_number><test_number>.out`

Checks if the output of the program `<prefix><program_number>` produces the same output as the given .out file.

This program was designed to make this sort of testing convenient in a university course on C programming.

##Setting up

1. `chmod+x difftest.sh`

2. Put testcase inputs and outputs in a "testcases" directory or specify another directory using the -d flag.

##Usage Examples:

* `./difftest.sh` : Tests all the programs in the current directory in respect to the testcases within the testcases directory, their prefix being "q" by default
* `./difftest.sh -d /eecs/course/2031/labs/lab3` : Tests all programs in respect to the testcases in the specified directory
* `./difftest.sh -p v` : Same as first, but filename prefix is "v"
* `./difftest.sh -l 2` : Same as first, but the program number is parsed at two digits
