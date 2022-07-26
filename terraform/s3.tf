terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "s3-kokobops-dipvlom"
    region     = "ru-central1"
    key        = "kokobops-bucket.tfstate"
    #access_key = var.ACCESS_KEY
    #secret_key = var.SECRET_KEY

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
