consul {
  address        = "{{ ansible_default_ipv4.address }}:8500"
  auto_advertise = true

  client_service_name = "nomad-client"
  client_auto_join    = true

  server_service_name = "nomad-server"
  server_auto_join    = true
}
