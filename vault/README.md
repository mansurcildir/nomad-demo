# HashiCorp Vault

Secure, store, and tightly control access to tokens, passwords, certificates, encryption keys for protecting secrets, and other sensitive data using a UI, CLI, or HTTP API..

## Installation Vault

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vault
```

## Initializing Vault

unseal key;
```bash
vault operator unseal <UNSEAL_KEY1>
vault operator unseal <UNSEAL_KEY2>
vault operator unseal <UNSEAL_KEY3>
```

vault cli login;
```bash
vault login <INITIAL_ROOT_TOKEN>
```

enable kv version 2;
```bash
vault secrets enable -path=secret kv-v2
```

enable nomad jwt auth;
```bash
vault auth enable -path jwt-nomad jwt
```

write nomad jwt auth config;
```bash
vault write auth/jwt-nomad/config @jwt-nomad-config.json
```

write jwt auth roles of the nomad-workloads;
```bash
vault write auth/jwt-nomad/role/nomad-workloads @nomad-workloads-role.json
```

write the policy of the nomad workloads;
```bash
./nomad-workloads-policy.sh
```

write the jwt auth roles of the nomad tasks;
```bash
vault write auth/jwt-nomad/role/fiqo-backend @fiqo-backend-role.json
vault write auth/jwt-nomad/role/fiqo-panel @fiqo-panel-role.json
vault write auth/jwt-nomad/role/grafana @grafana-role.json
vault write auth/jwt-nomad/role/minio-a1 @minio-a1-role.json
vault write auth/jwt-nomad/role/minio-a2 @minio-a1-role.json
vault write auth/jwt-nomad/role/minio-b1 @minio-a1-role.json
vault write auth/jwt-nomad/role/minio-b2 @minio-a1-role.json
```

write the policies of the nomad tasks;
```bash
vault policy write fiqo-backend fiqo-backend-policy.hcl
vault policy write fiqo-panel fiqo-panel-policy.hcl
vault policy write fiqo-db fiqo-db-policy.hcl
vault policy write minio minio-policy.hcl
```

## Screenshots

<img width="1843" height="1008" alt="Screenshot from 2025-12-18 19-02-25" src="https://github.com/user-attachments/assets/0ca5b15a-10e4-4680-9404-82845ad00c38" />
<img width="1843" height="1008" alt="Screenshot from 2025-12-18 19-02-37" src="https://github.com/user-attachments/assets/642001b7-b037-4d33-9506-6bd93f42d7be" />
<img width="1843" height="1008" alt="Screenshot from 2025-12-18 19-01-58" src="https://github.com/user-attachments/assets/5dc876d9-f31d-4a15-942c-876d5d8a24b7" />
