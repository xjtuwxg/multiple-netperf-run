#!/bin/sh

echo "======= Reporting Result ======="

TEST_CASE=( "tcp_rr" "tcp_stream" "udp_rr" "udp_stream" )

for test_case in ${TEST_CASE[@]}
do
        echo "Reporting test case:" $test_case

        for cnt in 1 5 20 100 400
        do
                cat $test_case".result"$cnt | grep " 100 " | awk '{print $NF}' | awk '{sum+=$1} END {print "Netperf stream x" NR ", result:", sum}'
        done

        echo
done
