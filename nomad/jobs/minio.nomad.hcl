job "minio" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "minio" {
    count = 1

    constraint {
      attribute = "${node.unique.name}"
      operator  = "="
      value     = "manager1"
    }

    network {
      port "api" {
        static = 9000
      }
      port "console" {
        static = 9001
      }
    }

    service {
      name = "minio-api"
      port = "api"

      check {
        name     = "alive"
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    service {
      name = "minio-console"
      port = "console"

      check {
        name     = "alive"
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "minio" {
      driver = "docker"

      config {
        image = "minio/minio:latest"
        ports = ["api", "console"]

        command = "server"
        args    = ["/data", "--console-address", ":9001"]

        mount {
          type   = "bind"
          source = "/opt/nomad/data/fiqo-minio/data"
          target = "/data"
        }
      }

      env {
        MINIO_ROOT_USER     = "admin"
        MINIO_ROOT_PASSWORD = "admin123"
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
