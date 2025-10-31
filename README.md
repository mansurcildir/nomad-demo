192.168.99.104 -> manager1  
192.168.99.107 -> manager2  
192.168.99.108 -> manager3  
192.168.99.105 -> worker1  
192.168.99.106 -> worker2  

tüm node'lar için dnsmasq config;  
nano /etc/dnsmasq.d/10-consul.conf  

server=/consul/192.168.99.104#8600  
listen-address=192.168.99.104

server=/consul/192.168.99.107#8600  
listen-address=192.168.99.107

server=/consul/192.168.99.108#8600  
listen-address=192.168.99.108

server=/consul/192.168.99.105#8600  
listen-address=192.168.99.105

server=/consul/192.168.99.106#8600  
listen-address=192.168.99.106

