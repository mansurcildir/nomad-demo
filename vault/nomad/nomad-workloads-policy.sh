#!/bin/bash

export AUTH_METHOD_ACCESSOR=$(vault auth list | grep jwt-nomad | awk '{ print $3 }')

vault policy write nomad-workloads-policy - << EOF
# Identity injection based on the Nomad job ID
path "apps/data/{{identity.entity.aliases.$AUTH_METHOD_ACCESSOR.metadata.nomad_job_id}}/*" {
  capabilities = ["read"]
}

path "apps/data/{{identity.entity.aliases.$AUTH_METHOD_ACCESSOR.metadata.nomad_job_id}}" {
  capabilities = ["read"]
}

path "apps/metadata/*" {
  capabilities = ["list"]
}

# Generic secrets
path "generic/data/*" {
  capabilities = ["read"]
}

path "generic/metadata/*" {
  capabilities = ["list"]
}
EOF
