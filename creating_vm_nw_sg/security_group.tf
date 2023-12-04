resource "yandex_vpc_security_group" "web_sg_ru_cental1_a" {
  name                = "My_sg_ru_cental1_a"
  network_id  = "${yandex_vpc_network.test-net_ru_cental1_a.id}"

  dynamic "ingress" {
    for_each = ["80", 443, 22]
    content {
      from_port       = ingress.value
      to_port          = ingress.value
      protocol              = "tcp"
      v4_cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description       = "Permit ANY"
    protocol          = "ANY"
    v4_cidr_blocks    = ["0.0.0.0/0"]
  }
}
