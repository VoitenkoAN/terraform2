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

resource "yandex_compute_instance" "platform1" {
  name        = "netology-${local.env}-${local.project}-${local.role[0]}"
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
    ssh-keys           = var.vm_metadata["ssh-keys"]
  }
}

resource "yandex_compute_instance" "platform2" {
  name        = "netology-${local.env}-${local.project}-${local.role[1]}"
  platform_id = var.vm_db_platform
  resources {
    cores         = var.vm_db_resource.cores
    memory        = var.vm_db_resource.memory
    core_fraction = var.vm_db_resource.core_fraction
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
    ssh-keys           = var.vm_metadata["ssh-keys"]
  }
}
