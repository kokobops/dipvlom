resource "yandex_compute_instance" "runner" {
  name                      = "runner"
  zone                      = "ru-central1-c"
  hostname                  = "runner.dipvlom.ru"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "fd826dalmbcl81eo5nig"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet_c.id
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
