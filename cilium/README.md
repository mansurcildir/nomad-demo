# Cilium

Cilium is an open source, cloud native solution for providing, securing, and observing network connectivity between workloads, fueled by the revolutionary Kernel technology eBPF.

## Installation Cilium CNI
```bash
export ARCH_CNI=$( [ $(uname -m) = aarch64 ] && echo arm64 || echo amd64)
export CNI_PLUGIN_VERSION=v1.8.0
curl -L -o cni-plugins.tgz "https://github.com/containernetworking/plugins/releases/download/${CNI_PLUGIN_VERSION}/cni-plugins-linux-${ARCH_CNI}-${CNI_PLUGIN_VERSION}".tgz
sudo mkdir -p /opt/cni/bin
sudo tar -C /opt/cni/bin -xzf cni-plugins.tgz
```

```bash
sudo docker run --rm --entrypoint bash -v /tmp:/out cilium/cilium:v1.13.2 -c \
'cp /usr/bin/cilium* /out; cp /opt/cni/bin/cilium-cni /out'
```

```bash
sudo mv /tmp/cilium-cni /opt/cni/bin/cilium-cni
```

```bash
sudo mv /tmp/cilium* /usr/local/bin
```

## Screenshots

<img width="1847" height="1051" alt="Screenshot from 2025-12-10 20-00-59" src="https://github.com/user-attachments/assets/f2f8062a-418e-41f4-bc3b-b1f6b3b9f47c" />
<img width="1847" height="1051" alt="Screenshot from 2025-12-10 20-01-08" src="https://github.com/user-attachments/assets/cd1d988f-804f-4577-bfaa-9dcce5f602d2" />
<img width="1847" height="1051" alt="Screenshot from 2025-12-10 20-01-50" src="https://github.com/user-attachments/assets/1b77a383-8c6a-46c6-a917-c83f0473e4ad" />
