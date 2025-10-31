job "fiqo-panel" {
  datacenters = ["dc1"]

  group "fiqo-panel" {
    count = 2

    network {
      port "panel" {
        to = 80
      }
    }

    service {
      name = "fiqo-panel"
      port = "panel"

      check {
        name     = "alive"
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "fiqo-panel" {
      driver = "docker"

      config {
        image = "mansur74/fiqo-panel:latest"
        ports = ["panel"]
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
