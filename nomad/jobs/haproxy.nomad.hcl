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

      check {
        name     = "alive"
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "haproxy" {
      driver = "docker"

      config {
        image   = "haproxy:2.0"
        network_mode = "host"

        ports   = ["http", "haproxy_ui"]
        volumes = [
          "local/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg",
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
    server-template fiqo-backend 10 _fiqo-backend._tcp.service.consul resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4 check

backend fiqo_panel
    balance roundrobin
    server-template fiqo-panel 10 _fiqo-panel._tcp.service.consul resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4 check

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
