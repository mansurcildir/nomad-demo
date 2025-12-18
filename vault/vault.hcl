disable_cache           = true
disable_mlock           = true
ui                      = true
listener "tcp" {
  address     = "HOST_ADDR:8200"
  tls_disable = 1
}
storage "consul" {
  address = "HOST_ADDR:8500"
  path    = "vault"
}
api_addr                = "http://HOST_ADDR:8200"
max_lease_ttl           = "10h"
default_lease_ttl       = "10h"
cluster_name            = "vault"
raw_storage_endpoint    = true
disable_sealwrap        = true
disable_printable_check = true
