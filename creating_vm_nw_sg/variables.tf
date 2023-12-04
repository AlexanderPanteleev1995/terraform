variable "zone_ru_central1_a" {
    description = "Please enter zone"
    type = string
    default = "ru-central1-a"
}


variable "yandex_compute_image" {
    description = "Please enter image"
    type = string
    default = "ubuntu-2204-lts"
}

variable "allow_stopping_for_update" {
    description = "Please enter"
    type = bool
    default = "true"
}

variable "size_memory_resourses" {
    default = {
        "prod" = 4
        "dev" = 2
    }
}
variable "size_cores_resourses" {
    default = {
        "prod" = 4
        "dev" = 2
    }
}

variable "env" {
    type = string
}