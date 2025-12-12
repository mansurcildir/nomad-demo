job "loki" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "loki" {
    count = 1

    network {
      mode = "cni/cilium"
    }

    service {
      name         = "loki"
      port         = 3100
      tags         = ["loki"]
      address_mode = "alloc"
    }

    task "loki" {
      driver = "docker"

      config {
        image   = "grafana/loki:latest"
        args    = ["-config.file=/etc/loki/loki.yml", "-config.expand-env=true"]
        volumes = [
          "/mnt/glusterfs/loki/loki.yml:/etc/loki/loki.yml",
          "/mnt/glusterfs/loki/data:/loki",
          "/mnt/glusterfs/loki/compactor:/loki/compactor"
        ]
      }

      resources {
        cpu    = 100
        memory = 300
      }
    }
  }
}
