# nomad-demo

This demonstration shows a documentation of ``Hashicorp Nomad`` cluster setup and orchestration for FIQO (File Quick Online) application.

• ``192.168.99.101`` -> ``server1``  
• ``192.168.99.102`` -> ``server2``  
• ``192.168.99.103`` -> ``server3``  
• ``192.168.99.104`` -> ``client1``  
• ``192.168.99.105`` -> ``client2``

• ``192.168.99.100`` -> ``VIP (HAProxy)``

## Tech Stack

✅ **OS:** ``Ubuntu/Debian``

✅ **Containerization:** ``Docker``

✅ **Orchestration:** ``Hashicorp Nomad``

✅ **Service Discovery and KV Store:** ``Hashicorp Consul``

✅ **Overlay Network**: ``eBPF``, ``Cilium``, ``Cilium CNI``

✅ **Scalable Network Filesystem**: ``Gluster``

✅ **Load Balancer**: ``HAProxy``, ``keepalived (active-passive)``

✅ **Auto Scaler**: ``nomad-autoscaler``

✅ **DNS Resolver**: ``systemd-resolved``, ``Hashicorp Consul``

✅ **Multi-Master Distributed Postgres**: ``pgEdge (active-active)``

✅ **Monitoring**: ``Grafana``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;• Metrics: ``Prometheus``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;• Logs: ``Loki``, ``Promtail``

**Demo App**: https://github.com/mansurcildir/fiqo  
**PgEdge Docs**: https://docs.pgedge.com/platform/installing_pgedge/manual

## Screenshots

Screenshots of an example demonstration for ``Ubuntu/Debian`` physical machines with ``server1``  and ``client1``.

• ``192.168.1.46`` -> ``server1``  
• ``192.168.1.194`` -> ``client1``

• ``192.168.1.100`` -> ``VIP (HAProxy)``

<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-24-37" src="https://github.com/user-attachments/assets/2811f0fd-01d0-4993-bb55-290e1e78407b" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-25-41" src="https://github.com/user-attachments/assets/18f7d0d4-0d2f-4f72-bb3a-6c3dc93cdfc6" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-26-06" src="https://github.com/user-attachments/assets/de8fc021-5a63-47e0-a544-ac415f0b37e4" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 13-56-17" src="https://github.com/user-attachments/assets/a45fc5e2-a9c1-418e-8ab5-ef9ad6ff0660" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-27-43" src="https://github.com/user-attachments/assets/a5296a85-b813-4cc4-bfae-6a8971cfe686" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-27-52" src="https://github.com/user-attachments/assets/05d3e7b6-32d8-4892-a105-9f93b391c451" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 19-57-54" src="https://github.com/user-attachments/assets/57c3af61-2c5e-4e1a-94ba-832ac8b5ac20" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-09-57" src="https://github.com/user-attachments/assets/015f1358-9b68-49db-a905-0ff0924b18e3" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-08-00" src="https://github.com/user-attachments/assets/19c026b3-c5e0-4273-839c-53b5c4fdc57b" />
<img width="1851" height="1051" alt="Screenshot from 2025-11-20 16-37-57" src="https://github.com/user-attachments/assets/22ec22d9-c09b-467e-95a2-dd8507a06a6e" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-07-31" src="https://github.com/user-attachments/assets/3081f1f6-68ee-4a57-8e47-97b20981dd1d" />
