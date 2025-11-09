job "node-exporter" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "system"

  group "node-exporter" {
    network {
      port "exporter" {
        static = 9100
      }
    }

    service {
      name = "node-exporter"
      port = "exporter"
      tags = ["node-exporter"]
    }

    task "node-exporter" {
      driver = "docker"

      config {
        image = "prom/node-exporter:latest"
        ports = ["exporter"]
      }

      resources {
        cpu    = 100
        memory = 200
      } 
    }
  }
}
