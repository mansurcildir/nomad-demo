data_dir  = "/opt/nomad/data"
bind_addr = "0.0.0.0"

server {
  enabled          = true
  bootstrap_expect = 3
}

client {
  enabled           = true
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
  enabled = true
  address = "http://active.vault.service.consul:8200"

  default_identity {
    aud = ["production"]
    ttl = "30m"
  }
}

telemetry {
  prometheus_metrics         = true
  publish_allocation_metrics = true
  publish_node_metrics       = true
}

advertise {
  http = "192.168.99.103:4646"
  rpc  = "192.168.99.103:4647"
  serf = "192.168.99.103:4648"
}
