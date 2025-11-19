job "node-exporter" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "system"

  group "node-exporter" {
    network {
      port "http"{
        static = 9100
      }
    }

    service {
      name = "node-exporter"
      port = "http"
      tags = ["node-exporter"]
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
