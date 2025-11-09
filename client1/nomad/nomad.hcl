data_dir  = "/opt/nomad/data"
bind_addr = "0.0.0.0"

server {
  enabled = false
}

client {
  enabled = true
  servers           = ["192.168.1.122"]
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

telemetry {
  prometheus_metrics         = true
  collection_interval        = "10s"
  publish_allocation_metrics = true
  publish_node_metrics       = true
}

advertise {
  http = "192.168.1.30:4646"
  rpc  = "192.168.1.30:4647"
  serf = "192.168.1.30:4648"
}
