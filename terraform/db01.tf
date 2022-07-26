resource "yandex_compute_instance" "db01" {
  name                      = "db01"
  zone                      = "ru-central1-b"
  hostname                  = "db01.dipvlom.ru"

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
    subnet_id  = yandex_vpc_subnet.subnet_b.id
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
