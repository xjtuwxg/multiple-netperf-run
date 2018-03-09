#!/bin/sh

if [ $# -ne 2 ]; then
        echo -e "\nPlease use '$0 <Server IP> <Exec Time>' to run this command!\n"
        exit 1
fi

SERVER_IP=$1
EXEC_TIME=$2

echo "Server IP: " $SERVER_IP  "Exec time:" $EXEC_TIME "seconds for each test case"

TEST_RESULT_NAME="tcp_rr.result"
BIN=./netperf-2.6.0/src/netperf
#SIGNATURE='16384 '


for cnt in 1 5 20 100 400
do
        echo
        echo $cnt "netperf streams running ..."
        echo > $TEST_RESULT_NAME$cnt

        for ((i=1; i <= $cnt; i++)); do
                $BIN -H $SERVER_IP -l $EXEC_TIME -t tcp_rr -- -r 100,100 >> $TEST_RESULT_NAME$cnt &
        done
        wait

        echo "Write result to" $TEST_RESULT_NAME$cnt
        cat $TEST_RESULT_NAME$cnt | grep "100      100" | awk '{print $6}' | awk '{sum+=$1} END {print "Netperf stream number =", NR, ", sum =", sum} '
done
