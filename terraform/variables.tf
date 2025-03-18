variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "expense"
    Environment = "dev"
    Terraform = "true"
    Component = "frontend"
  }
}

variable "zone_name" {
  default = "prajai.online"
}


## created this as pert of jenkins CD deployment with nexus so that paas the version to pick the latest code
variable "app_version" {
  
}