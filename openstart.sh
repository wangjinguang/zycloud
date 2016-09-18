/sbin/iptables -I INPUT -p tcp --dport 8888 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 8761 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 8181 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 9999 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 35556 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 27017 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 6379 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 8787 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 6161 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 7474 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 7473 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 9090 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 8081 -j ACCEPT

