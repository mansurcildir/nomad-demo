job "node-exporter" {
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

      check {
        name         = "alive"
        type         = "tcp"
        interval     = "10s"
        timeout      = "2s"
        port         = "exporter"
      }
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
