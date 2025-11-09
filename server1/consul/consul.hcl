datacenter = "dc1"
node_name = "server1"
data_dir = "/opt/consul"
client_addr = "0.0.0.0"
ui_config{
  enabled = true
}
bind_addr = "192.168.1.122"
advertise_addr = "192.168.1.122"
server = true
bootstrap_expect=1
retry_join = []
