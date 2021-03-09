#!/bin/bash

FILE=statistics.txt

#FLAKY TESTS
IFS=$'\n' flaky=( $(grep -i "flaky'" cypress/integration/LSP/*  | awk  -F'[:]' '{print $1}') )
IFS=$'\n' flaky_tests=( $(grep -i "flaky'" cypress/integration/LSP/*  | awk -F"[']" '{print $4}') )


#FLAKY THEIA TESTS
IFS=$'\n' flaky_theia=( $(grep -i "flaky_theia'" cypress/integration/LSP/* | awk  -F'[:]' '{print $1}') )
IFS=$'\n' flaky_theia_tests=( $(grep -i "flaky_theia'" cypress/integration/LSP/*  | awk -F"[']" '{print $4}') )

#BUG TESTS
IFS=$'\n' bug=( $(grep -i "bug'" cypress/integration/LSP/*  | awk -F"[:]" '{print $1}') )
IFS=$'\n' bug_tests=( $(grep -i "bug'" cypress/integration/LSP/*  | awk -F"[']" '{print $4}') )

#INVESTIGATION TESTS
IFS=$'\n' investigation=( $(grep -i "investigation'" cypress/integration/LSP/*  | awk -F"[:]" '{print $1}') )
IFS=$'\n' investigation_tests=( $(grep -i "investigation'" cypress/integration/LSP/*  | awk -F"[']" '{print $4}') )

function FLAKY() {
    echo "FLAKY TESTS"
    echo "==========================================================================================================================================="
    echo  "| tag | files | tests |"
    echo "==========================================================================================================================================="
    for i in ${!flaky[@]}
	    do
            echo "| flaky | ${flaky[$i]} | ${flaky_tests[$i]} |"
            echo "==========================================================================================================================================="
        done
   
}
FLAKY > $FILE

function FLAKY_THEIA() {
    echo ""
    echo "FLAKY THEIA TESTS"
    echo "==========================================================================================================================================="
    echo  "| tag | files | tests |"
    echo "==========================================================================================================================================="
    for i in ${!flaky_theia[@]}
	    do
            echo "| flaky_theia | ${flaky_theia[$i]} | ${flaky_theia_tests[$i]} |"
            echo "==========================================================================================================================================="
        done
}
FLAKY_THEIA >> $FILE

function BUG() {
    echo ""
    echo "BUG TESTS"
    echo "==========================================================================================================================================="
    echo  "| tag | files | tests |"
    echo "==========================================================================================================================================="
    for i in ${!bug[@]}
	    do
            echo "| bug | ${bug[$i]} | ${bug_tests[$i]} |"
            echo "==========================================================================================================================================="
        done
}
BUG >> $FILE

function INVESTIGATION() {
    echo ""
    echo "INVESTIGATION TESTS"
    echo "==========================================================================================================================================="
    echo  "| tag | files | tests |"
    echo "==========================================================================================================================================="
   for i in ${!investigation[@]}
	    do
            echo "| investigation | ${investigation[$i]} | ${investigation_tests[$i]} |"
            echo "==========================================================================================================================================="
        done
}
INVESTIGATION >> $FILE

function final(){
    echo ""
    echo "FINAL STATISTICS"
    echo "=========================="
    echo "|Tag           | Count    |"
    echo "|flaky         | $(grep "flaky |" $FILE | wc -l)    |"
    echo "|flaky_theia   | $(grep flaky_theia $FILE | wc -l)    |"
    echo "|bug           |  $(grep bug $FILE | wc -l)    |" 
    echo "|investigation |  $(grep investigation $FILE | wc -l)    |"
    echo "=========================="
}
final >> $FILE