job "minio-lb-b" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "minio-lb-b" {
    count = 1

    network {
      mode = "cni/cilium"
    }

    service {
      name         = "minio-lb-b"
      port         = 8080
      tags         = ["minio-lb-b"]
      address_mode = "alloc"
    }

    task "minio-lb-b" {
      driver = "docker"

      config {
        image        = "haproxy:3.2"
        volumes      = [
          "local/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg"
        ]
      }

      template {
        data = <<EOF
global
    maxconn 2000

defaults
    mode http
    timeout connect 5s
    timeout client  50s
    timeout server  50s

frontend stats
   bind *:1936
   stats uri /
   stats show-legends
   no log

frontend minio-api-frontend
   bind *:9000
   default_backend minio-api-backend

backend minio-api-backend
    balance roundrobin
{{ range $index, $service := service "minio-b1-api" }}
    server minio-b1-api{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

{{ range $index, $service := service "minio-b2-api" }}
    server minio-b2-api{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

frontend minio-console-frontend
   bind *:9001
   default_backend minio-console-backend

backend minio-console-backend
    balance roundrobin
{{ range $index, $service := service "minio-b1-console" }}
    server minio-b1-console{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

{{ range $index, $service := service "minio-b2-console" }}
    server minio-b2-console{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

resolvers consul
    nameserver consul 127.0.0.1:8600
    accepted_payload_size 8192
    hold valid 5s
EOF

        destination = "local/haproxy.cfg"
      }

      resources {
        cpu    = 200
        memory = 100
      }
    }
  }
}
