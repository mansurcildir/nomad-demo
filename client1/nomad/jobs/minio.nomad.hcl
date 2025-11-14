job "minio" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "minio" {
    count = 2

    network {
      mode = "cni/cilium"
    }

    service {
      name         = "minio-api"
      port         = 9000
      tags         = ["minio-api"]
      address_mode = "alloc"
    }

    service {
      name         = "minio-console"
      port         = 9001
      tags         = ["minio-console"]
      address_mode = "alloc"
    }

    task "minio" {
      driver = "docker"

      config {
        image   = "minio/minio:latest"
        command = "server"
        args    = ["/data", "--console-address", ":9001"]
        volumes = [
          "/mnt/glusterfs/minio/data:/data"
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
