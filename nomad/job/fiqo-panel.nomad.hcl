job "fiqo-panel" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "fiqo-panel" {
    count = 2

    network {
      mode = "cni/cilium"
    }

    service {
      name         = "fiqo-panel"
      port         = 80
      tags         = ["fiqo-panel"]
      address_mode = "alloc"
    }

    task "fiqo-panel" {
      driver = "docker"

      vault {
        role = "fiqo-panel"
      }

      config {
        image = "mansur74/fiqo-panel:latest"
      }

      template {
        data = <<EOT
        SPRING_BASE_URL = "{{with secret "secret/data/fiqo-panel"}}{{index .Data.data "SPRING_BASE_URL"}}{{end}}"
        EOT

        destination     = "local/.env"
        env             = true
        change_mode     = "restart"
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
