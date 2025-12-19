# HashiCorp Consul

Service networking solution that enables teams to manage secure network connectivity between services, across on-prem, hybrid cloud, and multi-cloud environments and runtimes.

## Installation Consul

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul
```

## Screenshots

<img width="1845" height="1011" alt="Screenshot from 2025-12-10 20-11-51" src="https://github.com/user-attachments/assets/481b721b-27bc-4e62-b4b4-454cd0b18016" />
<img width="1855" height="1052" alt="Screenshot from 2025-11-19 14-27-52" src="https://github.com/user-attachments/assets/05d3e7b6-32d8-4892-a105-9f93b391c451" />
