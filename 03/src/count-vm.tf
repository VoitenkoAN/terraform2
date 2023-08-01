resource "yandex_compute_instance" "platform-1" {
  count = 2
  name        = "${local.env}-${local.project}-${local.role[0]}-${count.index+1}"
  platform_id = var.vm_web_platform
  resources {
    cores         = var.vm_web_resource.cores
    memory        = var.vm_web_resource.memory
    core_fraction = var.vm_web_resource.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vm_metadata["serial-port-enable"]
    ssh-keys           = "ubuntu:${local.key_ssh}"
  }
}