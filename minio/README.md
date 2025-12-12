# MinIO

This demonstration shows a documentation of ``MinIO``  master-backup setup between clusters which is active-active replication.

• ``minio-cluster-a`` (master) -> ``minio-a1``, ``minio-a2``  
• ``minio-cluster-b`` (backup) -> ``minio-b1``, ``minio-b2``

Each cluster has a HAProxy load balancer at the beginning for high availability.

The one-way replication rule is initiated  with ``mc replicate add`` from ``minio-cluster-a`` to ``minio-cluster-b``
  

The integrity of ``minio-cluster-a`` is checked by the systemd service and the data is synchronized once via ``mc mirror`` when ``minio-cluster-a`` is up.

<img width="864" height="767" alt="relation-diagram" src="https://github.com/user-attachments/assets/496b963e-3159-481e-a6e7-87d388b6c364" />
<img width="584" height="545" alt="scheduling-diagram" src="https://github.com/user-attachments/assets/f6c3fe03-1b06-4f15-a146-32dd6d7a7777" />
