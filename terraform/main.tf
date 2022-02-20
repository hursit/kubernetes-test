terraform {
  backend "gcs" {
    credentials = "./gco.json"
    bucket      = "deneme"
    prefix      = "terraform/state"
  }
}