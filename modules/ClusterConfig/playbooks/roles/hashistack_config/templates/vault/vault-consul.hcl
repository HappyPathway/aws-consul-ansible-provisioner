backend "consul" {
  address = "{{ ansible_default_ipv4.address }}:8500"
  path    = "vault/"
}
