variable "sg_rules" {
  description = "List of security group rules for inbound traffic"
  type = list(object({
    port     = number
    protocol = string
    cidr     = string
  }))
  default = [
    { port = 22, protocol = "tcp", cidr = "213.57.121.34/32" }, 
    { port = 80, protocol = "tcp", cidr = "0.0.0.0/0" },
    { port = 443, protocol = "tcp", cidr = "0.0.0.0/0" }
  ]
}
