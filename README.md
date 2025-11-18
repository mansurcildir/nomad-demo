# nomad-demo

This demonstration shows a documentation of ``Hashicorp Nomad`` cluster setup and orchestration for FIQO (File Quick Online) application.

• ``192.168.99.101`` -> ``server1``  
• ``192.168.99.102`` -> ``server2``  
• ``192.168.99.103`` -> ``server3``  
• ``192.168.99.104`` -> ``client1``  
• ``192.168.99.105`` -> ``client2``

## Tech Stack

**OS:** ``Ubuntu/Debian``

**Containerization:** ``Docker``

**Orchestration:** ``Hashicorp Nomad``

**Service Discovery and KV Store:** ``Hashicorp Consul``

**Overlay Network**: ``eBPF``, ``Cilium``, ``Cilium CNI``

**Scalable Network Filesystem**: ``Gluster``

**Load Balancer**: ``HAProxy`` ``keepalived (active-passive)``

**Auto Scaler**: ``nomad-autoscaler``

**DNS Resolver**: ``systemd-resolved``, ``Hashicorp Consul``

**Monitoring**: ``Prometheus``, ``Grafana``

**Demo App**: https://github.com/mansurcildir/fiqo

## Screenshots

Screenshots of an example demonstration for ``Ubuntu/Debian`` physical machines with 1 server and 1 client.

• ``192.168.1.46`` -> ``server1``  
• ``192.168.1.194`` -> ``client1`` 

<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-08-28" src="https://github.com/user-attachments/assets/0b07ff3b-f492-41f2-9547-b8b3f6bf8efa" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-08-36" src="https://github.com/user-attachments/assets/cbfe4bb1-296a-4437-9481-24718ec9c053" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-09-02" src="https://github.com/user-attachments/assets/de79c01d-e196-4881-8b9d-b8b0d1366204" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 19-56-30" src="https://github.com/user-attachments/assets/bf92182a-2da0-445f-b687-6da36f951897" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 19-57-01" src="https://github.com/user-attachments/assets/fa5f552f-664e-4ed2-92d6-10dcca844648" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-08-06" src="https://github.com/user-attachments/assets/711b4aad-1b24-42e7-813c-708a4aea5d90" />
<img width="1855" height="1044" alt="Screenshot from 2025-11-17 19-55-08" src="https://github.com/user-attachments/assets/217cde17-b115-4993-be6d-f04ad844d6fb" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 19-57-54" src="https://github.com/user-attachments/assets/57c3af61-2c5e-4e1a-94ba-832ac8b5ac20" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-09-57" src="https://github.com/user-attachments/assets/015f1358-9b68-49db-a905-0ff0924b18e3" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-07-31" src="https://github.com/user-attachments/assets/3081f1f6-68ee-4a57-8e47-97b20981dd1d" />

