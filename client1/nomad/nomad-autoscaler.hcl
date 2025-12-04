                                                      /etc/systemd/system/nomad-autoscaler.service                                                                    [Unit]
Description=Nomad Autoscaler
Requires=network-online.target nomad.service
After=network-online.target nomad.service

[Service]
Type=simple
User=nomad
Group=nomad
ExecStart=/usr/local/bin/nomad-autoscaler agent -config=/opt/nomad/data/nomad-autoscaler.hcl -http-bind-port=8081
Restart=on-failure
SyslogIdentifier=nomad-autoscaler

[Install]
WantedBy=multi-user.target



