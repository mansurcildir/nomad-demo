job "promtail" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "system"

  group "promtail" {
    network {
      port "promtail" {
        static = 9080
      }
    }

    service {
      name = "promtail"
      port = "promtail"
      tags = ["promtail"]
    }

    task "promtail" {
      driver = "docker"

      config {
        image   = "grafana/promtail:latest"
        ports   = ["promtail"]

        args    = ["-config.file=/etc/promtail/promtail.yml"]
        volumes = [
          "/mnt/glusterfs/promtail/promtail.yml:/etc/promtail/promtail.yml",
          "/mnt/glusterfs/promtail/positions:/tmp",
          "/var/log:/alloc/logs:ro",
          "/var/lib/docker/containers:/var/lib/docker/containers:ro"
        ]
      }

      resources {
        cpu    = 100
        memory = 300
      }
    }
  }
}
