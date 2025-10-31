job "prometheus" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "prometheus" {
    count = 1

    constraint {
      attribute = "${node.unique.name}"
      operator  = "="
      value     = "manager1"
    }

    network {
      port "prometheus" {
        static = 9091
      }
    }

    service {
      name = "prometheus"
      port = "prometheus"

      check {
        name     = "alive"
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "prometheus" {
      driver = "docker"

      config {
        image = "prom/prometheus:latest"
        ports = ["prometheus"]
        args = [
          "--web.listen-address=:9091",
          "--config.file=/etc/prometheus/prometheus.yml",
          "--storage.tsdb.path=/prometheus"
        ]

        mount {
          type   = "bind"
          source = "/opt/nomad/data/fiqo-prometheus/prometheus.yml"
          target = "/etc/prometheus/prometheus.yml"
        }

        mount {
          type   = "bind"
          source = "/opt/nomad/data/fiqo-prometheus/data"
          target = "/prometheus"
        }
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
