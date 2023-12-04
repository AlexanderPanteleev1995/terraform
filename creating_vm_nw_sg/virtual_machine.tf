data "yandex_compute_image" "last_ubuntu" {
  family = var.yandex_compute_image  # ОС (Ubuntu, 22.04 LTS)
}

resource "yandex_compute_instance" "web_ru_cental1_a" { 
  zone = var.zone_ru_central1_a
	platform_id = "standard-v1" # тип процессора (Intel Broadwell)
  allow_stopping_for_update = var.allow_stopping_for_update
  depends_on = [ yandex_vpc_network.test-net_ru_cental1_a, yandex_vpc_subnet.test-subnet-a_ru_cental1_a, yandex_vpc_address.addr_ru_cental1_a ]
  resources {
    core_fraction = 5 # Гарантированная доля vCPU
    cores = lookup(var.size_cores_resourses, var.env)
    memory = lookup(var.size_memory_resourses, var.env)
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.last_ubuntu.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.test-subnet-a_ru_cental1_a.id
    nat = true
    nat_ip_address = yandex_vpc_address.addr_ru_cental1_a.external_ipv4_address[0].address
  }
  metadata = {
    user-data = file("cloud_config.yml")
  }
}


