mc alias set lb-a http://minio-lb-a.service.consul:9000 admin admin123
mc alias set lb-b http://minio-lb-b.service.consul:9000 admin admin123

mc mb lb-a/fiqo
mc mb lb-b/fiqo

mc version enable lb-a/fiqo
mc version enable lb-b/fiqo

mc replicate add lb-a/fiqo \
  --remote-bucket lb-b/fiqo \
  --replicate "existing-objects,delete,delete-marker" \
  --priority 1

mc replicate add lb-b/fiqo \
  --remote-bucket lb-a/fiqo \
  --replicate "existing-objects,delete,delete-marker" \
  --priority 1
