• 192.168.99.104 -> manager1  
• 192.168.99.107 -> manager2  
• 192.168.99.108 -> manager3  
• 192.168.99.105 -> worker1  
• 192.168.99.106 -> worker2

dnsmasq configuration for Rocky Linux cluster nodes;

• manager1
sudo nano /etc/dnsmasq.d/10-consul.conf  
server=/consul/127.0.0.1#8600  
listen-address=192.168.99.104

• manager2
sudo nano /etc/dnsmasq.d/10-consul.conf  
server=/consul/127.0.0.1#8600  
listen-address=192.168.99.107

• manager3
sudo nano /etc/dnsmasq.d/10-consul.conf  
server=/consul/127.0.0.1#8600  
listen-address=192.168.99.108

• worker1
sudo nano /etc/dnsmasq.d/10-consul.conf  
server=/consul/127.0.0.1#8600  
listen-address=192.168.99.105

• worker2
sudo nano /etc/dnsmasq.d/10-consul.conf  
server=/consul/127.0.0.1#8600  
listen-address=192.168.99.106

systemd-resolved config for Ubuntu host machine;

sudo nano /etc/systemd/resolved.conf.d/consul.conf
[Resolve]
DNS=192.168.99.104 192.168.99.107 192.168.99.108
Domains=~consul