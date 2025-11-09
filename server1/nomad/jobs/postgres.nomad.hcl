job "postgres" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "postgres" {
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
      name         = "postgres"
      port         = 5432
      tags         = ["postgres"]
      address_mode = "alloc"
    }

    task "postgres" {
      driver = "docker"

      config {
        image   = "postgres:16.3-alpine"
        volumes = [
          "/opt/nomad/data/postgres/data:/var/lib/postgresql/data"
        ]
      }

      env {
        POSTGRES_DB       = "fiqo"
        POSTGRES_USER     = "admin"
        POSTGRES_PASSWORD = "admin123"
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
