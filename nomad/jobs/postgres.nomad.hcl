job "postgres" {
  datacenters = ["dc1"]
  type        = "service"

  group "postgres" {
    count = 1

    constraint {
      attribute = "${node.unique.name}"
      operator  = "="
      value     = "manager1"
    }
   
    network {
      port "postgres" {
        static = 5432
      }
    }

    service {
      name = "postgres"
      port = "postgres"

      check {
         name     = "alive"
         type     = "tcp"
         interval = "10s"
         timeout  = "2s"
      }
    }

    task "postgres" {
      driver = "docker"

      config {
        image = "postgres:16.3-alpine"
        ports = ["postgres"]

        mount {
          type   = "bind"
          source = "/opt/nomad/data/fiqo-postgres/data"
          target = "/var/lib/postgresql/data"
        }
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
