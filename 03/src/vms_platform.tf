variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v1"
  description = "standard"
}

variable "vm_web_resource" {
  type = map(any)
  default = {
    "cores"         = 2
    "memory"        = 1
    "core_fraction" = 5
  }
  description = "resource"
}
variable "vm_web_platform_scheduling_policy" {
  type        = bool
  default     = true
  description = "scheduling"
}
variable "vm_web_platform_network_interface_nat" {
  type        = string
  default     = true
  description = "interface nat"


}
# variable "vm_db_platform" {
#   type        = string
#   default     = "standard-v1"
#   description = "standard"
# }

# variable "vm_db_resource" {
#   type = map(any)
#   default = {
#     "cores"         = 2
#     "memory"        = 2
#     "core_fraction" = 20
#   }
#   description = "resource"
# }

variable "vm_metadata" {
  type = map(any)
  default = {
    "serial-port-enable" = 1
    "ssh-keys"           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtBTNxw4UvxU4Qc1kvCJxmBqBJMqOWS5VTptnojhFXrxJQLyK7uiQ9d66L0sri7jyPws5o148QbT3HEjshG0ugOMps0c+CAqOgn3lZqAEPxqU3PpcQau5yK3sa/Wo87B78EGzoZ8PIsqiyBv004oP/YcKURWSPYSKSlospS0JuAozv0CGWf05LHp6dxixiS1dlLY+zaORgl4fJ/zD4q0ErE7yx8E5kAqGBXDAgzoDZl9jbEHBmI3iU9AKNCMSts3eCnYmrDQuMgwyX4gTAwpkFI7Ft73IGeJMpXC2SjvRX9l2l33QudS5tySqozFPFAIRbXCdCXeMv+r31qfDimIIr7hDV+LPyAKEp7LuYL+oJK4EhDjfXN93+9RYMvkq3M5/tUQYvAwiu3c4ts9RBmCtJvRFc5NJNYP59qxRbIAJTxy+rdDl3TlCZ1fpq6ue+SkBclvFF5na/6WUawOJZwWx9T40hiBHTDrsNBl/mtkAIaZhbLdltAkkk1WFjbmqxGAc= voitenko@debian"
  }
}

variable "forwarded_settings_one" {
  description = "your"
  type = list(object({
    vm_name       = string,
    cpu           = number,
    ram           = number,
    core_fraction = number,
    disk          = number
  }))
  default = [{
    vm_name       = "01",
    cpu           = 2,
    ram           = 4,
    disk          = 15,
    core_fraction = 5
  }]
}
variable "forwarded_settings_two" {
  description = "your"
  type = list(object({
    vm_name       = string,
    cpu           = number,
    ram           = number,
    core_fraction = number,
    disk          = number
  }))
  default = [{
    vm_name       = "02",
    cpu           = 4,
    ram           = 6,
    disk          = 25,
    core_fraction = 20
  }]
}
variable "count_disk_size" {
  type = number
  default = 1
}