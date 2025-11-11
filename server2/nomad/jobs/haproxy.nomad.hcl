job "haproxy" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "haproxy" {
    count = 1

    network {
      port "http" {
        static = 8080
      }

      port "haproxy_ui" {
        static = 1936
      }
    }

    service {
      name = "haproxy"
      port = "http"
      tags = ["haproxy"]
    }

    task "haproxy" {
      driver = "docker"

      config {
        image   = "haproxy:3.2"
        ports   = ["http", "haproxy_ui"]

        volumes = [
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

frontend http_front
   bind *:8080

   acl path_api path_beg /api

   use_backend fiqo_backend if path_api

   default_backend fiqo_panel

backend fiqo_backend
  http-request replace-path ^/api(/.*)? \1
  balance roundrobin
{{ $i := 0 }}
{{ range service "fiqo-backend" }}
  {{ $i = add $i 1 }}
  server fiqo-backend{{$i}} {{ .Address }}:{{ .Port }} check
{{ end }}

backend fiqo_panel
  balance roundrobin
{{ $i := 0 }}
{{ range service "fiqo-panel" }}
  {{ $i = add $i 1 }}
  server fiqo-panel{{$i}} {{ .Address }}:{{ .Port }} check
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
