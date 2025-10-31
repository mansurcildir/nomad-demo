datacenter = "dc1"
node_name = "worker2"
data_dir = "/opt/consul"
client_addr = "0.0.0.0"
ui_config{
  enabled = true
}
bind_addr = "192.168.99.106"
advertise_addr = "192.168.99.106"
server = false
retry_join = ["192.168.99.104", "192.168.99.107", "192.168.99.108"]

