# multiple-netperf-run
The script to run multiple netperf request and calculate PPS, bandwidth.

To use it, first edit the `.sh` file. Replace `BIN=./netperf-2.6.0/src/netperf` with the correct `netperf` binary location. Execute the script with:
```
[root@vm-client ~]# ./tcp_rr.sh 192.168.3.200 60
Server IP:  192.168.3.200 Exec time: 60 seconds for each test case

1 netperf streams running ...
Write result to tcp_rr.result1
Netperf stream number = 1 , sum = 14056.6

5 netperf streams running ...
Write result to tcp_rr.result5
Netperf stream number = 5 , sum = 59364.2

20 netperf streams running ...
Write result to tcp_rr.result20
Netperf stream number = 20 , sum = 182166

100 netperf streams running ...
Write result to tcp_rr.result100
Netperf stream number = 100 , sum = 354820

400 netperf streams running ...
Write result to tcp_rr.result400
Netperf stream number = 400 , sum = 432563
```
