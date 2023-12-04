resource "yandex_vpc_network" "test-net_ru_cental1_a" {
  name = "test_network_ru_cental1_a"
}

resource "yandex_vpc_subnet" "test-subnet-a_ru_cental1_a" {
  v4_cidr_blocks = ["10.3.0.0/16"]
  zone           = var.zone_ru_central1_a
  network_id     = "${yandex_vpc_network.test-net_ru_cental1_a.id}"
}

resource "yandex_vpc_address" "addr_ru_cental1_a" {
  name = "ipadr_ru_cental1_a"
  external_ipv4_address {
    zone_id = var.zone_ru_central1_a
  }
}
