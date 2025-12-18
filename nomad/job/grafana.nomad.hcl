job "grafana" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "grafana" {
    count = 1

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

      vault {
        role = "grafana"
      }

      config {
        image   = "grafana/grafana:latest"
        volumes = [
          "/mnt/glusterfs/grafana/data:/var/lib/grafana"
        ]
      }

      template {
        data = <<EOT
        GF_SECURITY_ADMIN_USER     = "{{with secret "secret/data/grafana"}}{{index .Data.data "GF_SECURITY_ADMIN_USER"}}{{end}}"
        GF_SECURITY_ADMIN_PASSWORD = "{{with secret "secret/data/grafana"}}{{index .Data.data "GF_SECURITY_ADMIN_PASSWORD"}}{{end}}"
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
