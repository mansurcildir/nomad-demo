#!/bin/bash

ENDPOINT="http://haproxy.service.consul:9000"
ALIAS="lb"
USER="admin"
PASS="admin123"

BUCKET="fiqo"
SOURCE_DIR="/home/mansur/Desktop/minio-test/data"
PARALLEL_JOBS=5
ITERATIONS=10
LOG_FILE="/home/mansur/Desktop/minio-test/test.log"

mc alias set $ALIAS $ENDPOINT $USER $PASS

upload_job() {
    local folder=$1
    local start_time=$(date +%s)

    echo "[$(date)] Starting upload for $folder" | tee -a $LOG_FILE

    mc cp -r "$SOURCE_DIR" "$ALIAS/$BUCKET/$folder"

    if [ $? -eq 0 ]; then
        local end_time=$(date +%s)
        echo "[$(date)] Upload $folder FINISHED in $((end_time-start_time))s" | tee -a $LOG_FILE
    else
        echo "[$(date)] Upload $folder FAILED" | tee -a $LOG_FILE
    fi
}

echo "[$(date)] Cleaning old test folders..." | tee -a $LOG_FILE
mc ls --recursive "$ALIAS/$BUCKET" | awk '{print $NF}' | grep '^test_' | while read folder; do
    echo "Removing $folder" | tee -a $LOG_FILE
    mc rm -r --force "$ALIAS/$BUCKET/$folder"
done

echo "[$(date)] Starting test test..." | tee -a $LOG_FILE

for i in $(seq 1 $ITERATIONS); do
    folder="test_$i"
    upload_job "$folder" &

    while (( $(jobs -r | wc -l) >= PARALLEL_JOBS )); do
        sleep 1
    done
done

wait

echo "[$(date)] Test COMPLETED"
