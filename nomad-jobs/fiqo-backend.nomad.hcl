job "fiqo-backend" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "fiqo-backend" {
    count = 1

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

      config {
        image = "mansur74/fiqo-backend:latest"
      }

      template {
        data = <<EOT
        FIQO_DB_HOST          = {{ key "secret/fiqo-db/HOST" }}
        FIQO_DB_PORT          = {{ key "secret/fiqo-db/PORT" }}
        FIQO_DB_DATABASE      = {{ key "secret/fiqo-db/DATABASE" }}
        FIQO_DB_USERNAME      = {{ key "secret/fiqo-db/USERNAME" }}
        FIQO_DB_PASSWORD      = {{ key "secret/fiqo-db/PASSWORD" }}

        PANEL_BASE_URL        = {{ key "secret/fiqo-backend/PANEL_BASE_URL" }}

        STORAGE_STRATEGY      = {{ key "secret/fiqo-backend/STORAGE_STRATEGY" }}
        MINIO_BASE_URL        = {{ key "secret/fiqo-backend/MINIO_BASE_URL" }}
        MINIO_BUCKET_NAME     = {{ key "secret/fiqo-backend/MINIO_BUCKET_NAME" }}
        MINIO_ACCESS_KEY      = {{ key "secret/minio/MINIO_ROOT_USER" }}
        MINIO_SECRET_KEY      = {{ key "secret/minio/MINIO_ROOT_PASSWORD" }}

        ACCESS_TOKEN_EXP_MIN  = {{ key "secret/fiqo-backend/ACCESS_TOKEN_EXP_MIN" }}
        REFRESH_TOKEN_EXP_MIN = {{ key "secret/fiqo-backend/REFRESH_TOKEN_EXP_MIN" }}
        ACCESS_TOKEN_KEY      = {{ key "secret/fiqo-backend/ACCESS_TOKEN_KEY" }}
        REFRESH_TOKEN_KEY     = {{ key "secret/fiqo-backend/REFRESH_TOKEN_KEY" }}

        GOOGLE_CLIENT_ID      = {{ key "secret/fiqo-backend/GOOGLE_CLIENT_ID" }}
        GOOGLE_CLIENT_SECRET  = {{ key "secret/fiqo-backend/GOOGLE_CLIENT_SECRET" }}

        GITHUB_CLIENT_ID      = {{ key "secret/fiqo-backend/GITHUB_CLIENT_ID" }}
        GITHUB_CLIENT_SECRET  = {{ key "secret/fiqo-backend/GITHUB_CLIENT_SECRET" }}

        SMTP_HOST             = {{ key "secret/fiqo-backend/SMTP_HOST" }}
        SMTP_PORT             = {{ key "secret/fiqo-backend/SMTP_PORT" }}
        SENDER_EMAIL          = {{ key "secret/fiqo-backend/SENDER_EMAIL" }}
        SENDER_EMAIL_PASSWORD = {{ key "secret/fiqo-backend/SENDER_EMAIL_PASSWORD" }}
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
