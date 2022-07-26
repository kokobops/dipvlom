resource "yandex_compute_instance" "proxy" {
  name                      = "proxy"
  zone                      = "ru-central1-a"
  hostname                  = "dipvlom.ru"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "fd89681vdciaeqsurfhv"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet_a.id
    nat        = true
    ip_address = "172.16.10.254"
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
