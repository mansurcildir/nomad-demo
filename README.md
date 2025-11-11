# nomad-demo

This demonstration shows a documentation of nomad cluster setup and service management for FIQO (File Quick Online) application with Docker, Cilium, HashiCorp Nomad, HashiCorp Consul.

• 192.168.99.101 -> server1  
• 192.168.99.102 -> server2  
• 192.168.99.103 -> server3  
• 192.168.99.104 -> client1  
• 192.168.99.105 -> client2

## Tech Stack

**OS:** Ubuntu/Debian

**Containerization:** Docker

**Orchestration:** Hashicorp Nomad

**Service Discovery and KV Store:** Hashicorp Consul

**Overlay Network**: Cilium, Cilium CNI

**DNS Resolver**: systemd-resolved

**Demo App**: https://github.com/mansurcildir/fiqo

## Screenshots

Screenshots of an example demonstration for physical machines with 1 server and 1 client.

• 192.168.1.46 -> server1  
• 192.168.1.194 -> client1  

<img width="856" height="908" alt="Screenshot from 2025-11-11 11-21-02" src="https://github.com/user-attachments/assets/daf78e04-9add-4b89-9590-c0d3cb89be26" />

Server1:
<img width="1266" height="680" alt="Screenshot from 2025-11-11 11-24-33" src="https://github.com/user-attachments/assets/734642cf-0bbc-40b2-a558-9ad0ed1d55fb" />
Client1:
<img width="1261" height="355" alt="Screenshot from 2025-11-11 11-37-18" src="https://github.com/user-attachments/assets/16c77589-27ec-4585-b60d-ec7ac12a8650" />
<img width="1840" height="1010" alt="Screenshot from 2025-11-11 11-28-51" src="https://github.com/user-attachments/assets/d6707614-2cb8-4517-9a65-189b1dad673d" />
<img width="1843" height="1012" alt="Screenshot from 2025-11-11 11-12-28" src="https://github.com/user-attachments/assets/ed00a3a8-0c74-4097-896f-c91e906eb0eb" />
<img width="1843" height="1012" alt="Screenshot from 2025-11-11 11-12-43" src="https://github.com/user-attachments/assets/88f8bdc4-fb47-4d2e-ab9e-5deebf87ede0" />
<img width="1840" height="1010" alt="Screenshot from 2025-11-11 11-33-19" src="https://github.com/user-attachments/assets/2d2f2428-b970-4a4f-800f-47eb78b5d3e7" />
<img width="1843" height="1012" alt="Screenshot from 2025-11-11 11-11-04" src="https://github.com/user-attachments/assets/f657a167-a8e4-4dbb-9259-0f1135f88117" />
<img width="1843" height="1012" alt="Screenshot from 2025-11-11 11-10-32" src="https://github.com/user-attachments/assets/30dd6ed7-2ac7-4f20-98c5-039146c68b5a" />
<img width="1838" height="998" alt="Screenshot from 2025-10-31 12-57-37" src="https://github.com/user-attachments/assets/d6ae892d-1426-41b0-815e-b10862362189" />
