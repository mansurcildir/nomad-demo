#!/bin/bash

# --- fiqo-db ---
consul kv put secret/fiqo-db/HOST haproxy.service.consul
consul kv put secret/fiqo-db/PORT 5432
consul kv put secret/fiqo-db/DATABASE fiqo
consul kv put secret/fiqo-db/USERNAME admin
consul kv put secret/fiqo-db/PASSWORD admin123

# --- fiqo-backend ---
consul kv put secret/fiqo-backend/PANEL_BASE_URL http://haproxy.service.consul:80
consul kv put secret/fiqo-backend/STORAGE_STRATEGY s3
consul kv put secret/fiqo-backend/MINIO_BASE_URL http://haproxy.service.consul:9000
consul kv put secret/fiqo-backend/MINIO_BUCKET_NAME fiqo
consul kv put secret/fiqo-backend/ACCESS_TOKEN_EXP_MIN 5
consul kv put secret/fiqo-backend/REFRESH_TOKEN_EXP_MIN 30
consul kv put secret/fiqo-backend/ACCESS_TOKEN_KEY 561744090F30C5564F793305AB783BC96545E88EE42A7ED0CED578C72CE132A3
consul kv put secret/fiqo-backend/REFRESH_TOKEN_KEY 561744090F30C5564F793305AB783BC96545E88EE42A7ED0CED578C72CE132A3
consul kv put secret/fiqo-backend/GOOGLE_CLIENT_ID YOUR_GOOGLE_CLIENT_ID
consul kv put secret/fiqo-backend/GOOGLE_CLIENT_SECRET YOUR_GOOGLE_CLIENT_SECRET
consul kv put secret/fiqo-backend/GITHUB_CLIENT_ID YOUR_GITHUB_CLIENT_ID
consul kv put secret/fiqo-backend/GITHUB_CLIENT_SECRET YOUR_GITHUB_CLIENT_SECRET
consul kv put secret/fiqo-backend/SMTP_HOST smtp.gmail.com
consul kv put secret/fiqo-backend/SMTP_PORT 587
consul kv put secret/fiqo-backend/SENDER_EMAIL YOUR_SENDER_EMAIL
consul kv put secret/fiqo-backend/SENDER_EMAIL_PASSWORD YOUR_EMAIL_PASSWORD

# --- fiqo-panel ---
consul kv put secret/fiqo-panel/SPRING_BASE_URL http://haproxy.service.consul:8080

# --- minio ---
consul kv put secret/minio/MINIO_ROOT_USER admin
consul kv put secret/minio/MINIO_ROOT_PASSWORD admin123

# --- grafana ---
consul kv put secret/grafana/GF_SECURITY_ADMIN_USER admin
consul kv put secret/grafana/GF_SECURITY_ADMIN_PASSWORD admin123

echo "Successfully written all secrets!"
