datacenter = "dc1"
node_name = "manager3"
data_dir = "/opt/consul"
client_addr = "0.0.0.0"
ui_config{
  enabled = true
}
bind_addr = "192.168.99.108"
advertise_addr = "192.168.99.108"
server = true
bootstrap_expect=3
retry_join = ["192.168.99.104", "192.168.99.107"]

