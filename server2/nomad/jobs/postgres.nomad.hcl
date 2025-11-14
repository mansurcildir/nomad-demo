job "postgres" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "postgres" {
    count = 1
   
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
      driver    = "docker"

      config {
        image   = "postgres:16.3-alpine"
        volumes = [
          "/mnt/glusterfs/postgres/data:/var/lib/postgresql/data"
        ]
      }

      template {
        data = <<EOT
        POSTGRES_DB       = {{ key "secret/fiqo-db/DATABASE" }}
        POSTGRES_USER     = {{ key "secret/fiqo-db/USERNAME" }}
        POSTGRES_PASSWORD = {{ key "secret/fiqo-db/PASSWORD" }}
        EOT

        destination       = "local/.env"
        env               = true
        change_mode       = "restart"
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
