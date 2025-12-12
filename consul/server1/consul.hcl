datacenter       = "dc1"
node_name        = "server1"
data_dir         = "/opt/consul"
client_addr      = "0.0.0.0"

ui_config{
  enabled = true
}

bind_addr        = "192.168.99.101"
advertise_addr   = "192.168.99.101"
server           = true
bootstrap_expect = 3
retry_join       = ["192.168.99.101", "192.168.99.102", "192.168.99.103"]
