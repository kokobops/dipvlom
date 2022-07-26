resource "yandex_vpc_network" "dipvlom_vpc" {
  name = "dipvlom_vpc"
}

resource "yandex_vpc_route_table" "nat_instance_route" {
  name                    = "nat_instance_route"
  network_id              = yandex_vpc_network.dipvlom_vpc.id
  static_route {
    destination_prefix    = "0.0.0.0/0"
    next_hop_address      = "172.16.10.254"
  }
}

resource "yandex_vpc_subnet" "subnet_a" {
  name = "subnet_a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.dipvlom_vpc.id
  v4_cidr_blocks = ["172.16.10.0/24"]
  route_table_id = yandex_vpc_route_table.nat_instance_route.id
}

resource "yandex_vpc_subnet" "subnet_b" {
  name = "subnet_b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.dipvlom_vpc.id
  v4_cidr_blocks = ["172.16.20.0/24"]
  route_table_id = yandex_vpc_route_table.nat_instance_route.id
}

resource "yandex_vpc_subnet" "subnet_c" {
  name = "subnet_c"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.dipvlom_vpc.id
  v4_cidr_blocks = ["172.16.30.0/24"]
  route_table_id = yandex_vpc_route_table.nat_instance_route.id
}
