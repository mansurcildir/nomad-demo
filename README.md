# nomad-demo

This demo shows a documentation of nomad cluster setup and service management for FIQO (File Quick Online) application with Docker, Cilium, HashiCorp Nomad, HashiCorp Consul.

• 192.168.99.101 -> server1  
• 192.168.99.102 -> server2
• 192.168.99.103 -> server3  
• 192.168.99.104 -> client1
• 192.168.99.105 -> client2

## Tech Stack

**OS:** Ubuntu/Debian

**Containerization:** Docker

**Orchestration:** Hashicorp Nomad

**Service Discovery:** Hashicorp Consul

**Kv Store:** Hashicorp Consul

**Overlay Network**: Cilium, Cilium CNI

**DNS Resolver**: systemd-resolved

**Demo App**: https://github.com/mansurcildir/fiqo
