variable "master_pass" {
  default = ""
}

variable "master_user" {
  default = ""
}

variable "main_zone" {
  default = "us-central1-a"
}

variable "additional_zones" {
  type = "list"
  default = [
    "us-east-1-b",
    "us-west-1-a",
  ]
}