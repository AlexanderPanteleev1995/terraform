
resource "yandex_iam_service_account" "users" {
  count = length(var.user)
  name  = element(var.user, count.index)
}

data "yandex_iam_service_account" "builder" {
  count = length(var.user)
  name        = element(var.user, count.index)
  depends_on = [ yandex_iam_service_account.users ]
}

output "user_id" {
  value = [
    for x in data.yandex_iam_service_account.builder:
      "${x.name} : ${x.id}" 
  ]
}


resource "yandex_resourcemanager_folder_iam_member" "admin-account-iam" {
  count = length(var.user)
  folder_id   = ""
  role        = "admin"
  member      = "serviceAccount:${data.yandex_iam_service_account.builder[count.index].id}"
}