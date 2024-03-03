variable "instance_name" {
    type = map
    default = {

        mongodb   = "t3.micro"
        mysql     = "t3.micro"
        web  = "t3.micro"
    }
}


variable "ami_id" {
    type= string
    default = "ami-0f3c7d07486cad139"
  }

variable "zone_id" {
    default = "Z036409435RKJNFLFMM4O"
}

variable "domain_name" {
    default = "gmdproducts.online"
}
