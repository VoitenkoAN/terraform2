resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}

resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { 
       for_each-vm = yandex_compute_instance.platform2,
       count-vm = yandex_compute_instance.platform-1,
       count-disk-vm = yandex_compute_instance.wm-disk
    } 
  )

  filename = "${path.module}/inventory.yml"
} 