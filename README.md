# nomad-demo

This demonstration shows a documentation of ``Hashicorp Nomad`` cluster setup and orchestration for FIQO (File Quick Online) application.

• ``192.168.99.101`` -> ``server1``  
• ``192.168.99.102`` -> ``server2``  
• ``192.168.99.103`` -> ``server3``  
• ``192.168.99.104`` -> ``client1``  
• ``192.168.99.105`` -> ``client2``

Not: ``postgres``, ``minio``, ``prometheus`` and ``grafana`` are stateful services for the demo and are dependent on the ``server1`` node.

## Tech Stack

**OS:** ``Ubuntu/Debian``

**Containerization:** ``Docker``

**Orchestration:** ``Hashicorp Nomad``

**Service Discovery and KV Store:** ``Hashicorp Consul``

**Overlay Network**: ``Cilium``, ``Cilium CNI``

**DNS Resolver**: ``systemd-resolved``, ``Hashicorp Consul``

**Monitoring**: ``Prometheus``, ``Grafana``

**Demo App**: https://github.com/mansurcildir/fiqo

## Screenshots

Screenshots of an example demonstration for physical machines with 1 server and 1 client.

• ``192.168.1.46`` -> ``server1``  
• ``192.168.1.194`` -> ``client1``  

<img width="866" height="906" alt="Screenshot from 2025-11-11 12-58-33" src="https://github.com/user-attachments/assets/74357dfe-8118-409f-a29c-0e77ab346937" />
<img width="1303" height="668" alt="Screenshot from 2025-11-11 13-03-26" src="https://github.com/user-attachments/assets/efafca48-9e3e-49e2-bc5e-04f7d1bdc201" />
<img width="1298" height="401" alt="Screenshot from 2025-11-11 13-02-58" src="https://github.com/user-attachments/assets/fd58ad7e-c04d-4ebe-ab79-1e7aed5c0b3f" />
<img width="1843" height="1012" alt="Screenshot from 2025-11-11 11-12-28" src="https://github.com/user-attachments/assets/ed00a3a8-0c74-4097-896f-c91e906eb0eb" />
<img width="1843" height="1012" alt="Screenshot from 2025-11-11 11-12-43" src="https://github.com/user-attachments/assets/88f8bdc4-fb47-4d2e-ab9e-5deebf87ede0" />
<img width="1840" height="1010" alt="Screenshot from 2025-11-11 11-33-19" src="https://github.com/user-attachments/assets/2d2f2428-b970-4a4f-800f-47eb78b5d3e7" />
<img width="1837" height="1004" alt="Screenshot from 2025-11-11 17-03-18" src="https://github.com/user-attachments/assets/74f80227-ad98-4b91-8cd3-aa752a0d1359" />
<img width="1837" height="1004" alt="Screenshot from 2025-11-11 17-27-25" src="https://github.com/user-attachments/assets/f1c24d0e-aa8d-44d6-8bd4-7acaf78e540e" />
<img width="1843" height="1012" alt="Screenshot from 2025-11-11 11-10-32" src="https://github.com/user-attachments/assets/30dd6ed7-2ac7-4f20-98c5-039146c68b5a" />
<img width="1838" height="998" alt="Screenshot from 2025-10-31 12-57-37" src="https://github.com/user-attachments/assets/d6ae892d-1426-41b0-815e-b10862362189" />
