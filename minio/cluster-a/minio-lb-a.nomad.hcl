job "minio-lb-a" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "minio-lb-a" {
    count = 1

    network {
      mode = "cni/cilium"
    }

    service {
      name         = "minio-lb-a"
      port         = 8080
      tags         = ["minio-lb-a"]
      address_mode = "alloc"
    }

    task "minio-lb-a" {
      driver = "docker"

      config {
        image        = "haproxy:3.2"
        volumes      = [
          "local/haproxy:/usr/local/etc/haproxy"
        ]
      }

      template {
        change_mode = "signal"
        change_signal = "SIGHUP"
        destination = "local/haproxy/haproxy.cfg"
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
{{ range $index, $service := service "minio-a1-api" }}
    server minio-a1-api{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

{{ range $index, $service := service "minio-a2-api" }}
    server minio-a2-api{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

frontend minio-console-frontend
   bind *:9001
   default_backend minio-console-backend

backend minio-console-backend
    balance roundrobin
{{ range $index, $service := service "minio-a1-console" }}
    server minio-a1-console{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

{{ range $index, $service := service "minio-a2-console" }}
    server minio-a2-console{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

resolvers consul
    nameserver consul 127.0.0.1:8600
    accepted_payload_size 8192
    hold valid 5s
EOF
      }

      resources {
        cpu    = 200
        memory = 100
      }
    }
  }
}
