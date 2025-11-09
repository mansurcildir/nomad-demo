data_dir  = "/opt/nomad/data"
bind_addr = "0.0.0.0"

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled           = true
  servers           = ["192.168.1.122"]
  network_interface = "wlp0s20f3"
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
  http = "192.168.1.122:4646"
  rpc  = "192.168.1.122:4647"
  serf = "192.168.1.122:4648"
}

