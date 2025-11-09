job "prometheus" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "prometheus" {
    count = 1
    
    constraint {
      attribute = "${node.unique.name}"
      operator  = "="
      value     = "server1"
    }

    network {
      mode = "cni/cilium"
    }

    service {
      name         = "prometheus"
      port         = 9091
      tags         = ["prometheus"]
      address_mode = "alloc"
    }

    task "prometheus" {
      driver = "docker"

      config {
        image   = "prom/prometheus:latest"
        args    = [
          "--web.listen-address=:9091",
          "--config.file=/etc/prometheus/prometheus.yml",
          "--storage.tsdb.path=/prometheus"
        ]
        volumes = [
          "/opt/nomad/data/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml",
          "/opt/nomad/data/prometheus/data:/prometheus"
        ]
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
