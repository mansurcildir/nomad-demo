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
