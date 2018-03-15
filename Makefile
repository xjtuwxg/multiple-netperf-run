server_ip = 192.168.3.137

run:
        ./tcp_rr.sh $(server_ip) 60
        sleep 5
        ./tcp_stream.sh $(server_ip) 60
        sleep 5
        ./udp_rr.sh $(server_ip) 60
        sleep 5
        ./udp_stream.sh $(server_ip) 60

report:
        ./report.sh

clean:
        rm -rf *.result*
