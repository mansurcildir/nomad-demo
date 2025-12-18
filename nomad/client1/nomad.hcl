data_dir  = "/opt/nomad/data"
bind_addr = "0.0.0.0"

server {
  enabled = false
}

client {
  enabled = true
  servers           = ["192.168.99.101", "192.168.99.102", "192.168.99.103"]
  network_interface = "wlp8s0"
  cni_path          = "/opt/cni/bin"
  cni_config_dir    = "/opt/cni/config"
}

plugin "docker" {
  config {
    volumes = [
      { enabled = true }
    ]
  }
}

vault {
  enabled               = true
  address               = "http://active.vault.service.consul:8200"
  jwt_auth_backend_path = "jwt-nomad"
}

telemetry {
  prometheus_metrics         = true
  publish_allocation_metrics = true
  publish_node_metrics       = true
}

advertise {
  http = "192.168.99.104:4646"
  rpc  = "192.168.99.104:4647"
  serf = "192.168.99.104:4648"
}
