variable "rg_name" {
  type = string
  default = "hackaton"
}

variable "location" {
  type = string
  default = "germanywestcentral"
}

variable "func_name" {
  type = string
  description = "azure function public url prefix"
}
