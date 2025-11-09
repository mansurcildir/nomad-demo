job "fiqo-backend" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "fiqo-backend" {
    count = 2

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

      env{
        FIQO_DB_HOST          = "postgres.service.consul"
        FIQO_DB_PORT          = 5432
        FIQO_DB_DATABASE      = "fiqo"
        FIQO_DB_USERNAME      = "admin"
        FIQO_DB_PASSWORD      = "admin123"

        PANEL_BASE_URL        = "http://fiqo-panel.service.consul:80"

        STORAGE_STRATEGY      = "s3"
        MINIO_BASE_URL        = "http://minio-api.service.consul:9000"
        MINIO_BUCKET_NAME     = "fiqo"
        MINIO_ACCESS_KEY      = "admin"
        MINIO_SECRET_KEY      = "admin123"

        ACCESS_TOKEN_EXP_MIN  = 5
        REFRESH_TOKEN_EXP_MIN = 30
        ACCESS_TOKEN_KEY      = "561744090F30C5564F793305AB783BC96545E88EE42A7ED0CED578C72CE132A3"
        REFRESH_TOKEN_KEY     = "561744090F30C5564F793305AB783BC96545E88EE42A7ED0CED578C72CE132A3"

        GOOGLE_CLIENT_ID      = "YOUR_GOOGLE_CLIENT_ID"
        GOOGLE_CLIENT_SECRET  = "YOUR_GOOGLE_CLIENT_SECRET"

        GITHUB_CLIENT_ID      = "YOUR_GITHUB_CLIENT_ID"
        GITHUB_CLIENT_SECRET  = "YOUR_GITHUB_CLIENT_SECRET"

        SMTP_HOST             = "smtp.gmail.com"
        SMTP_PORT             = "587"
        SENDER_EMAIL          = "YOUR_SENDER_EMAIL"
        SENDER_EMAIL_PASSWORD = "YOUR_EMAIL_PASSWORD"
      }

      resources {
        cpu    = 100
        memory = 300
      }
    }
  }
}
