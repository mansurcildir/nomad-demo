nomad {
  address = "http://127.0.0.1:4646"
}

telemetry {
  prometheus_metrics = true
  disable_hostname   = true
}

apm "prometheus" {
  driver = "prometheus"
  config = {
    address = "http://haproxy.service.consul:9091"
  }
}

strategy "target-value" {
  driver = "target-value"
}
