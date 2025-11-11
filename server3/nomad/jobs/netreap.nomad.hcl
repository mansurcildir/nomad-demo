job "netreap" {
  datacenters = ["dc1"]
  priority    = 100
  type        = "system"

  constraint {
    attribute = "${attr.plugins.cni.version.cilium-cni}"
    operator = "is_set"
  }

  group "netreap" {
    service {
      name = "netreap"
      tags = ["netreap"]
    }

    task "netreap" {
      driver = "docker"

      env {
        NETREAP_CILIUM_CIDR = "172.16.0.0/16"
      }

      config {
        image        = "ghcr.io/cosmonic/netreap:0.1.0"
        network_mode = "host"

        volumes = [
          "/var/run/cilium:/var/run/cilium"
        ]
      }
    }
  }
}
