#difftest

A bash utility for testing programs using sets of inputs and expected outputs.

For a program with respective `<prefix><program_number><test_number>.in` and `<prefix><program_number><test_number>.out` files, applies `diff`
to the output of a compiled program of `<prefix><program_number>` within the directory to the `.out` file.

This program was designed to make this sort of testing convenient in a university course on C programming.

##Setting up

1. `chmod` the script:

    chmod+x difftest.sh

2. Have the testcase inputs and outputs in a "testcases" directory

##Usage Examples:

* `./difftest.sh` : Tests all the programs in the current directory in respect to the testcases within the testcases directory, their prefix being "q"
* `./difftest.sh -d tests` : Tests all programs in respect to testcases within a directory named "test"
* `./difftest.sh -p v` : Same as first, but filename prefix is "v"
* `./difftest.sh -l 2` : Same as first, but the program number is parsed at two digits
