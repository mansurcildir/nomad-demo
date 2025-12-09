job "minio" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "system"

  group "minio" {
    network {
      port "minio-api"{
        static = 9000
      }

      port "minio-console" {
        static = 9001
      }
    }

    service {
      name         = "minio-api"
      port         = "minio-api"
      tags         = ["minio-api"]
    }

    service {
      name         = "minio-console"
      port         = "minio-console"
      tags         = ["minio-console"]
    }

    task "minio" {
      driver = "docker"

      config {
        image   = "minio/minio:latest"
        network_mode = "host"

        args = [
          "server",
          "http://192.168.1.46/data",
          "http://192.168.1.194/data",
          "--console-address", ":9001"
        ]

        volumes = [
          "/mnt/minio/data:/data"
        ]
      }

      template {
        data = <<EOT
        MINIO_ROOT_USER     = {{ key "secret/minio/MINIO_ROOT_USER" }}
        MINIO_ROOT_PASSWORD = {{ key "secret/minio/MINIO_ROOT_PASSWORD" }}
        EOT

        destination         = "local/.env"
        env                 = true
        change_mode         = "restart"
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
