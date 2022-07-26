resource "yandex_compute_instance" "db02" {
  name                      = "db02"
  zone                      = "ru-central1-c"
  hostname                  = "db02.dipvlom.ru"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "fd826dalmbcl81eo5nig"
      type        = "network-hdd"
      size        = "15"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet_c.id
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
