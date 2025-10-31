data_dir  = "/opt/nomad/data"
bind_addr = "0.0.0.0"

server {
  enabled = false
}

client {
  enabled = true
  servers = ["192.168.99.104:4647", "192.168.99.107:4647", "192.168.99.108:4647"]
  network_interface = "enp0s8"
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
  http = "192.168.99.105:4646"
  rpc  = "192.168.99.105:4647"
  serf = "192.168.99.105:4648"
}

