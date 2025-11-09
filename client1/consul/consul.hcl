datacenter = "dc1"
node_name = "client1"
data_dir = "/opt/consul"
client_addr = "0.0.0.0"
ui_config{
  enabled = true
}
bind_addr = "192.168.1.30"
advertise_addr = "192.168.1.30"
server = false
retry_join = ["192.168.1.122"]
