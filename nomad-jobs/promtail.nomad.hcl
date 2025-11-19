job "promtail" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "system"

  group "promtail" {
    network {
      port "http" {
        static = 9080
      }
    }

    service {
      name = "promtail"
      port = "http"
      tags = ["promtail"]
    }

    task "promtail" {
      driver = "docker"

      config {
        image   = "grafana/promtail:latest"
        network_mode = "host"
        ports   = ["http"]

        args    = ["-config.file=/etc/promtail/promtail.yml"]
        volumes = [
          "/mnt/glusterfs/promtail/promtail.yml:/etc/promtail/promtail.yml",
          "/mnt/glusterfs/promtail/positions:/tmp",
          "/var/log:/alloc/logs:ro",
          "/var/lib/docker/containers:/var/lib/docker/containers:ro",
          "/opt/nomad/data/alloc:/opt/nomad/data/alloc:ro"
        ]
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
