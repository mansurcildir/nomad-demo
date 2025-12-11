#!/bin/bash

HEALTH_URL="http://minio-lb-a.service.consul:9000/minio/health/ready"
FLAG_FILE="/mnt/glusterfs/minio-sync.done"

while true; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$HEALTH_URL")

    if [ "$STATUS" -eq 200 ]; then
        if [ ! -f "$FLAG_FILE" ]; then
            echo "MinIO UP!"
            mc alias set lb-a http://minio-lb-a.service.consul:9000 admin admin123
            mc alias set lb-b http://minio-lb-b.service.consul:9000 admin admin123

            if mc mirror lb-b/fiqo lb-a/fiqo --overwrite --remove; then
                touch "$FLAG_FILE"
                echo "Synchronizing DONE!"
            else
                echo "Synchronizing FAILED!"
            fi
         fi
    else
        if [ -f "$FLAG_FILE" ]; then
            rm -f "$FLAG_FILE"
            echo "MinIO DOWN!"
        fi
    fi
done
