job "grafana" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "grafana" {
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
      name         = "grafana"
      port         = 3000
      tags         = ["grafana"]
      address_mode = "alloc"
    }

    task "grafana" {
      driver = "docker"

      config {
        image   = "grafana/grafana:latest"
        volumes = [
          "/opt/nomad/data/grafana/data:/var/lib/grafana"
        ]
      }

      template {
        data = <<EOT
        GF_SECURITY_ADMIN_USER     = {{ key "secret/grafana/GF_SECURITY_ADMIN_USER" }}
        GF_SECURITY_ADMIN_PASSWORD = {{ key "secret/grafana/GF_SECURITY_ADMIN_PASSWORD" }}
        EOT

        destination                = "local/.env"
        env                        = true
        change_mode                = "restart"
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
