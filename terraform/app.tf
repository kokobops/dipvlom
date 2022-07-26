resource "yandex_compute_instance" "app" {
  name                      = "app"
  zone                      = "ru-central1-a"
  hostname                  = "app.dipvlom.ru"

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
    subnet_id  = yandex_vpc_subnet.subnet_a.id
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
