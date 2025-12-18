job "fiqo-backend" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "fiqo-backend" {
    count = 1

    constraint {
      attribute = "${node.unique.name}"
      value     = "server1"
    }

    scaling {
      min     = 1
      max     = 2
      enabled = true

      policy {
        evaluation_interval = "5s"
        cooldown            = "1m"

        check "average_allocated_cpu" {
          source = "prometheus"
          query  = "avg(jvm_memory_used_bytes{area=\"heap\", job=\"fiqo-backend\"}) / avg(jvm_memory_max_bytes{area=\"heap\", job=\"fiqo-backend\"}) * 100"

          strategy "target-value" {
            target = 60
          }
        }
      }
    }

    network {
      mode = "cni/cilium"
    }

    service {
      name         = "fiqo-backend"
      port         = 8080
      tags         = ["fiqo-backend"]
      address_mode = "alloc"
    }

    task "fiqo-backend" {
      driver = "docker"

      vault {
        role = "fiqo-backend"
      }

      config {
        image = "mansur74/fiqo-backend:latest"
      }

      template {
        data = <<EOT
        FIQO_DB_HOST          = "{{with secret "secret/data/fiqo-db"}}{{index .Data.data "HOST"}}{{end}}"
        FIQO_DB_PORT          = "{{with secret "secret/data/fiqo-db"}}{{index .Data.data "PORT"}}{{end}}"
        FIQO_DB_DATABASE      = "{{with secret "secret/data/fiqo-db"}}{{index .Data.data "DATABASE"}}{{end}}"
        FIQO_DB_USERNAME      = "{{with secret "secret/data/fiqo-db"}}{{index .Data.data "USERNAME"}}{{end}}"
        FIQO_DB_PASSWORD      = "{{with secret "secret/data/fiqo-db"}}{{index .Data.data "PASSWORD"}}{{end}}"

        MINIO_ACCESS_KEY      = "{{with secret "secret/data/minio"}}{{index .Data.data "MINIO_ACCESS_KEY"}}{{end}}"
        MINIO_SECRET_KEY      = "{{with secret "secret/data/minio"}}{{index .Data.data "MINIO_SECRET_KEY"}}{{end}}"

        FLYWAY_ENABLED        = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "FLYWAY_ENABLED"}}{{end}}"
        PANEL_BASE_URL        = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "PANEL_BASE_URL"}}{{end}}"
        STORAGE_STRATEGY      = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "STORAGE_STRATEGY"}}{{end}}"
        MINIO_BASE_URL        = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "MINIO_BASE_URL"}}{{end}}"
        MINIO_BUCKET_NAME     = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "MINIO_BUCKET_NAME"}}{{end}}"
        ACCESS_TOKEN_EXP_MIN  = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "ACCESS_TOKEN_EXP_MIN"}}{{end}}"
        REFRESH_TOKEN_EXP_MIN = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "REFRESH_TOKEN_EXP_MIN"}}{{end}}"
        ACCESS_TOKEN_KEY      = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "ACCESS_TOKEN_KEY"}}{{end}}"
        REFRESH_TOKEN_KEY     = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "REFRESH_TOKEN_KEY"}}{{end}}"
        GITHUB_CLIENT_ID      = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "REFRESH_TOKEN_KEY"}}{{end}}"
        GITHUB_CLIENT_SECRET  = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "REFRESH_TOKEN_KEY"}}{{end}}"
        SMTP_HOST             = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "SMTP_HOST"}}{{end}}"
        SMTP_PORT             = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "SMTP_PORT"}}{{end}}"
        SENDER_EMAIL          = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "SENDER_EMAIL"}}{{end}}"
        SENDER_EMAIL_PASSWORD = "{{with secret "secret/data/fiqo-backend"}}{{index .Data.data "SENDER_EMAIL_PASSWORD"}}{{end}}"
        EOT

        destination           = "local/.env"
        env                   = true
        change_mode           = "restart"
      }

      resources {
        cpu    = 256
        memory = 512
      }
    }
  }
}
