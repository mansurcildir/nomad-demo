job "node-exporter" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "system"

  group "node-exporter" {
    network {
      mode = "cni/cilium"
    }

    service {
      name         = "node-exporter"
      port         = 9100
      tags         = ["node-exporter"]
      address_mode = "alloc"
    }

    task "node-exporter" {
      driver = "docker"

      config {
        image = "prom/node-exporter:latest"
      }

      resources {
        cpu    = 100
        memory = 200
      } 
    }
  }
}
