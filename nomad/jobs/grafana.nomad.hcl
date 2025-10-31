job "grafana" {
  datacenters = ["dc1"]
  type        = "service"

  group "grafana" {
    count = 1

    constraint {
      attribute = "${node.unique.name}"
      operator  = "="
      value     = "manager1"
    }

    network {
      port "grafana" {
        static = 3000
      }
    }
    
    service {
      name = "grafana"
      port = "grafana"

      check {
        name     = "alive"
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "grafana" {
      driver = "docker"

      config {
        image = "grafana/grafana:latest"
        ports = ["grafana"]

        mount {
          type   = "bind"
          source = "/opt/nomad/data/fiqo-grafana/data"
          target = "/var/lib/grafana"
        }
      }

      env {
        GF_SECURITY_ADMIN_USER     = "admin"
        GF_SECURITY_ADMIN_PASSWORD = "admin123"
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
