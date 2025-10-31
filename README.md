# nomad-demo

This demo demonstrates a simple cluster setup and service management using HashiCorp Nomad, Consul and Docker.

## Tech Stack
• VirtubalBox  
• 5 Rocky Linux VM  
• Docker  
• Hashicorp Nomad  
• Hashicorp Consul  
• Dnsmasq  

• 192.168.99.104 -> manager1  
• 192.168.99.107 -> manager2  
• 192.168.99.108 -> manager3  
• 192.168.99.105 -> worker1  
• 192.168.99.106 -> worker2

## Dns Records

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

## Screenshots
<img width="1846" height="885" alt="Screenshot from 2025-10-31 13-00-44" src="https://github.com/user-attachments/assets/ad07941a-6eed-43c7-8ef0-4ae470bf52eb" />
<img width="1846" height="885" alt="Screenshot from 2025-10-31 12-59-44" src="https://github.com/user-attachments/assets/d2583686-0cd6-4af7-bac6-1532984ae038" />
<img width="1838" height="927" alt="Screenshot from 2025-10-31 12-56-23" src="https://github.com/user-attachments/assets/7b6aa3bd-3921-4bcf-a207-d9216c9c1aea" />
<img width="1852" height="486" alt="Screenshot from 2025-10-31 12-58-27" src="https://github.com/user-attachments/assets/6592cbd2-4904-4fe8-89a6-23904e174829" />
<img width="1846" height="1004" alt="Screenshot from 2025-10-31 13-06-27" src="https://github.com/user-attachments/assets/8bc7aa74-3b32-40af-a4e2-0f35085f5b8b" />
<img width="1838" height="998" alt="Screenshot from 2025-10-31 12-57-37" src="https://github.com/user-attachments/assets/16b7b0f0-ee7a-4620-8e8f-13c10aff9c4b" />
