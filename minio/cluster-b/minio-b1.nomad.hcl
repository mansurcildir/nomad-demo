job "minio-b1" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "minio-b1" {
    count = 1

    constraint {
      attribute = "${node.unique.name}"
      value     = "server1"
    }

    network {
      mode = "cni/cilium"
    }

    service {
      name         = "minio-b1-api"
      port         = 9000
      tags         = ["minio-b1-api"]
      address_mode = "alloc"
    }

    service {
      name         = "minio-b1-console"
      port         = 9001
      tags         = ["minio-b1-console"]
      address_mode = "alloc"
    }

    task "minio" {
      driver = "docker"

      vault {
        role = "minio-b1"
      }

      config {
        image   = "minio/minio:latest"
        args    = [
          "server",
          "http://minio-b1-console.service.consul/data",
          "http://minio-b2-console.service.consul/data",
          "--console-address", ":9001"
        ]
        volumes = [
          "/mnt/minio-b1/data:/data"
        ]
      }

      template {
        data = <<EOT
        MINIO_ROOT_USER            = "{{with secret "secret/data/minio"}}{{index .Data.data "MINIO_ROOT_USER"}}{{end}}"
        MINIO_ROOT_PASSWORD        = "{{with secret "secret/data/minio"}}{{index .Data.data "MINIO_ROOT_PASSWORD"}}{{end}}"
        MINIO_PROMETHEUS_AUTH_TYPE = "{{with secret "secret/data/minio"}}{{index .Data.data "MINIO_PROMETHEUS_AUTH_TYPE"}}{{end}}"
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
