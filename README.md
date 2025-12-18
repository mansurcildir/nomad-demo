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

✅ **Secure Secret Manager:** ``Hashicorp Vault``

✅ **Multi-Master Distributed Postgres**: ``pgEdge (active-active)``

✅ **Multi-Master Distributed Object Storage**: ``MinIO (active-active)``

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

<img width="1847" height="1051" alt="Screenshot from 2025-12-10 20-00-59" src="https://github.com/user-attachments/assets/f2f8062a-418e-41f4-bc3b-b1f6b3b9f47c" />
<img width="1847" height="1051" alt="Screenshot from 2025-12-10 20-01-08" src="https://github.com/user-attachments/assets/cd1d988f-804f-4577-bfaa-9dcce5f602d2" />
<img width="1847" height="1051" alt="Screenshot from 2025-12-10 20-01-50" src="https://github.com/user-attachments/assets/1b77a383-8c6a-46c6-a917-c83f0473e4ad" />
<img width="1842" height="1011" alt="Screenshot from 2025-12-10 19-50-03" src="https://github.com/user-attachments/assets/53d4e7de-c12a-4a7b-b156-9e190b0abb50" />
<img width="1842" height="1011" alt="Screenshot from 2025-12-10 19-51-20" src="https://github.com/user-attachments/assets/ec0b59b8-9d89-4a1a-9be3-2066becb6d26" />
<img width="1842" height="1011" alt="Screenshot from 2025-12-10 19-51-41" src="https://github.com/user-attachments/assets/5350553e-706e-4a79-a9e9-7933c5fcb405" />
<img width="1842" height="1011" alt="Screenshot from 2025-12-10 19-50-32" src="https://github.com/user-attachments/assets/9cb0bd87-0aeb-4b75-845f-44f801df2b41" />
<img width="1842" height="1011" alt="Screenshot from 2025-12-10 19-50-40" src="https://github.com/user-attachments/assets/d25ded46-e7ff-451e-a2a0-6d36b6d5aec4" />
<img width="1845" height="1011" alt="Screenshot from 2025-12-10 20-11-51" src="https://github.com/user-attachments/assets/481b721b-27bc-4e62-b4b4-454cd0b18016" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-27-52" src="https://github.com/user-attachments/assets/05d3e7b6-32d8-4892-a105-9f93b391c451" />
<img width="1842" height="1011" alt="Screenshot from 2025-12-10 19-52-21" src="https://github.com/user-attachments/assets/f3138ebb-0474-40a5-a6fe-b4147bcb204e" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-09-57" src="https://github.com/user-attachments/assets/015f1358-9b68-49db-a905-0ff0924b18e3" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-08-00" src="https://github.com/user-attachments/assets/19c026b3-c5e0-4273-839c-53b5c4fdc57b" />
<img width="1851" height="1051" alt="Screenshot from 2025-11-20 16-37-57" src="https://github.com/user-attachments/assets/22ec22d9-c09b-467e-95a2-dd8507a06a6e" />
<img width="1855" height="1043" alt="Screenshot from 2025-11-17 20-07-31" src="https://github.com/user-attachments/assets/3081f1f6-68ee-4a57-8e47-97b20981dd1d" />
<img width="1859" height="366" alt="Screenshot from 2025-11-24 18-07-15" src="https://github.com/user-attachments/assets/01f8650e-17dd-42b5-9c9d-5d9da942a012" />
<img width="1859" height="366" alt="Screenshot from 2025-11-24 18-07-23" src="https://github.com/user-attachments/assets/7a84899e-8c04-44d1-9293-e4da62e9b7df" />
<img width="1843" height="1008" alt="Screenshot from 2025-12-18 19-02-25" src="https://github.com/user-attachments/assets/0ca5b15a-10e4-4680-9404-82845ad00c38" />
<img width="1843" height="1008" alt="Screenshot from 2025-12-18 19-02-37" src="https://github.com/user-attachments/assets/642001b7-b037-4d33-9506-6bd93f42d7be" />
<img width="1843" height="1008" alt="Screenshot from 2025-12-18 19-01-58" src="https://github.com/user-attachments/assets/5dc876d9-f31d-4a15-942c-876d5d8a24b7" />
