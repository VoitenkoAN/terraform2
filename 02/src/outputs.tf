output "external_ip_platform1" {
  value = yandex_compute_instance.platform1.network_interface.0.nat_ip_address
}

output "external_ip_platform2" {
  value = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
}
