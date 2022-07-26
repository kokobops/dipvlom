resource "yandex_compute_instance" "gitlab" {
  name                      = "gitlab"
  zone                      = "ru-central1-b"
  hostname                  = "gitlab.dipvlom.ru"

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
    subnet_id  = yandex_vpc_subnet.subnet_b.id
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
