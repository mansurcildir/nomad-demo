job "haproxy" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "system"

  group "haproxy" {
    network {
      port "http"{
        static = 8080
      }
    }

    service {
      name = "haproxy"
      port = "http"
      tags = ["haproxy"]
      address = "192.168.99.100"
    }

    task "haproxy" {
      driver = "docker"

      config {
        image        = "haproxy:3.2"
        network_mode = "host"
        ports        = ["http"]
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

frontend fiqo-backend-frontend
   bind *:8080
   default_backend fiqo-backend-backend

backend fiqo-backend-backend
    balance roundrobin
{{ range $index, $service := service "fiqo-backend" }}
    server fiqo-backend{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

frontend fiqo-panel-frontend
   bind *:8090
   default_backend fiqo-panel-backend

backend fiqo-panel-backend
    balance roundrobin
{{ range $index, $service := service "fiqo-panel" }}
    server fiqo-panel{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

frontend prometheus-frontend
   bind *:9091
   default_backend prometheus-backend

backend prometheus-backend
    balance roundrobin
{{ range $index, $service := service "prometheus" }}
    server prometheus{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

frontend loki-frontend
   bind *:3100
   default_backend loki-backend

backend loki-backend
    balance roundrobin
{{ range $index, $service := service "loki" }}
    server loki{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

frontend grafana-frontend
   bind *:3000
   default_backend grafana-backend

backend grafana-backend
    balance roundrobin
{{ range $index, $service := service "grafana" }}
    server grafana{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
{{ end }}

frontend minio-api-frontend
   bind *:9000
   default_backend minio-api-backend

backend minio-api-backend
    balance roundrobin
    option httpchk GET http://minio-lb-a.service.consul:9000/minio/health/ready
    http-check expect status 200
{{ range $index, $service := service "minio-lb-a" }}
    server minio-ca-api{{$index | add 1}} {{ $service.Address }}:9000 check
{{ end }}

{{ range $index, $service := service "minio-lb-b" }}
    server minio-cb-api{{$index | add 1}} {{ $service.Address }}:9000 check backup
{{ end }}

frontend minio-console-frontend
   bind *:9001
   default_backend minio-console-backend

backend minio-console-backend
    balance roundrobin
    option httpchk GET http://minio-lb-a.service.consul:9000/minio/health/ready
    http-check expect status 200
{{ range $index, $service := service "minio-lb-a" }}
    server minio-ca-console{{$index | add 1}} {{ $service.Address }}:9001 check
{{ end }}

{{ range $index, $service := service "minio-lb-b" }}
    server minio-cb-console{{$index | add 1}} {{ $service.Address }}:9001 check backup
{{ end }}

frontend postgres-frontend
    bind *:6543
    mode tcp
    default_backend postgres-backend

backend postgres-backend
    mode tcp
    balance roundrobin
{{ range $index, $service := service "postgres" }}
    server postgres{{$index | add 1}} {{ $service.Address }}:{{ $service.Port }} check
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
