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

      vault {
        role = "minio-a2"
      }

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
        env                   = true
        destination           = "local/.env"
        change_mode           = "restart"
        data = <<EOT
        MINIO_ROOT_USER            = "{{with secret "secret/data/minio"}}{{index .Data.data "MINIO_ROOT_USER"}}{{end}}"
        MINIO_ROOT_PASSWORD        = "{{with secret "secret/data/minio"}}{{index .Data.data "MINIO_ROOT_PASSWORD"}}{{end}}"
        MINIO_PROMETHEUS_AUTH_TYPE = "{{with secret "secret/data/minio"}}{{index .Data.data "MINIO_PROMETHEUS_AUTH_TYPE"}}{{end}}"
        EOT
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
