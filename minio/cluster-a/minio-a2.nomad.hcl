job "minio-a2" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "minio-a2" {
    count = 1

    constraint {
      attribute = "${node.unique.name}"
      value     = "client1"
    }

    network {
      mode = "cni/cilium"
    }

    service {
      name         = "minio-a2-api"
      port         = 9000
      tags         = ["minio-a2-api"]
      address_mode = "alloc"
    }

    service {
      name         = "minio-a2-console"
      port         = 9001
      tags         = ["minio-a2-console"]
      address_mode = "alloc"
    }

    task "minio" {
      driver = "docker"

      config {
        image   = "minio/minio:latest"
        args    = [
          "server",
          "http://minio-a1-console.service.consul/data",
          "http://minio-a2-console.service.consul/data",
          "--console-address", ":9001"
        ]
        volumes = [
          "/mnt/minio-a2/data:/data"
        ]
      }

      template {
        data = <<EOT
        MINIO_ROOT_USER            = {{ key "secret/minio/MINIO_ROOT_USER" }}
        MINIO_ROOT_PASSWORD        = {{ key "secret/minio/MINIO_ROOT_PASSWORD" }}
        MINIO_PROMETHEUS_AUTH_TYPE = {{ key "secret/minio/MINIO_PROMETHEUS_AUTH_TYPE" }}
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
