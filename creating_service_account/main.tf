terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.100.0"
    }
  }
}
provider "yandex" {
  folder_id = "" 
  cloud_id = ""
  service_account_key_file = "./authorized.json"
}
