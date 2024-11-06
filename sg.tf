resource "aws_security_group" "sg-webserver" {
  name        = "terraform_sg"
  description = "Allow SSH from local, and HTTP/HTTPS from anywhere"
  vpc_id      = "vpc-0d27f5a2055eabdca"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.sg_rules

    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr]
    }
  }
}
