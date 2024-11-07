variable "my_ip" {
  description = "The IP to be placed at the ssh sg"
  type        = string
  default     = "213.57.121.34/32"

}
variable "sg_rules" {
  description = "List of security group rules for inbound traffic"
  type = list(object({
    port     = number
    protocol = string
    cidr     = string
  }))
  default = [
    { port = 22, protocol = "tcp", cidr = "213.57.121.34/32"},
    { port = 80, protocol = "tcp", cidr = "0.0.0.0/0" },
    { port = 443, protocol = "tcp", cidr = "0.0.0.0/0" }
  ]
}

variable "vpc_id" {
  description = "Vpc ID for the creation of the security groups"
  default     = "vpc-0d27f5a2055eabdca"
}

variable "sg_name" {
  description = "The name that will be given upon the creation of the security groups"
  default     = "terraform_sg"
}
