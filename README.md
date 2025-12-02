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

✅ **Scalable Network Filesystem**: ``GlusterFS``

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

<img width="1859" height="1051" alt="Screenshot from 2025-11-24 17-12-18" src="https://github.com/user-attachments/assets/1bff394c-c8a3-419e-9853-bb902337b54a" />
<img width="1859" height="1051" alt="Screenshot from 2025-11-24 17-12-55" src="https://github.com/user-attachments/assets/ed228d73-0e18-4163-92b8-d0e4a3cec389" />
<img width="1859" height="1051" alt="Screenshot from 2025-11-24 17-13-04" src="https://github.com/user-attachments/assets/f0f44e31-fdbe-4ca6-be8c-f1d7f4290e8a" />
<img width="1859" height="1051" alt="Screenshot from 2025-11-24 17-16-42" src="https://github.com/user-attachments/assets/511ca203-5043-40b2-9fd7-f040537c10a9" />
<img width="1859" height="1051" alt="Screenshot from 2025-11-24 17-15-32" src="https://github.com/user-attachments/assets/95b09f6f-f9da-4709-b82a-c93069dab062" />
<img width="1859" height="1051" alt="Screenshot from 2025-11-24 17-15-41" src="https://github.com/user-attachments/assets/230d067c-0983-459a-a9ce-eaff223f9a40" />
<img width="1859" height="1051" alt="Screenshot from 2025-11-24 17-16-14" src="https://github.com/user-attachments/assets/83a081ed-92a0-482b-97f5-455771d2c19f" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-27-52" src="https://github.com/user-attachments/assets/05d3e7b6-32d8-4892-a105-9f93b391c451" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 19-57-54" src="https://github.com/user-attachments/assets/57c3af61-2c5e-4e1a-94ba-832ac8b5ac20" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-09-57" src="https://github.com/user-attachments/assets/015f1358-9b68-49db-a905-0ff0924b18e3" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-08-00" src="https://github.com/user-attachments/assets/19c026b3-c5e0-4273-839c-53b5c4fdc57b" />
<img width="1851" height="1051" alt="Screenshot from 2025-11-20 16-37-57" src="https://github.com/user-attachments/assets/22ec22d9-c09b-467e-95a2-dd8507a06a6e" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-07-31" src="https://github.com/user-attachments/assets/3081f1f6-68ee-4a57-8e47-97b20981dd1d" />
<img width="1859" height="366" alt="Screenshot from 2025-11-24 18-07-15" src="https://github.com/user-attachments/assets/01f8650e-17dd-42b5-9c9d-5d9da942a012" />
<img width="1859" height="366" alt="Screenshot from 2025-11-24 18-07-23" src="https://github.com/user-attachments/assets/7a84899e-8c04-44d1-9293-e4da62e9b7df" />


