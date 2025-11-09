job "minio" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "minio" {
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
          "/opt/nomad/data/minio/data:/data"
        ]
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
