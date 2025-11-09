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

      config {
        image = "mansur74/fiqo-panel:latest"
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
