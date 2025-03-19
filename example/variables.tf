variable "subnets" {
  default = ["subnet-abc123", "subnet-def456"]
}

variable "cert_arn" {
  default = "arn:aws:acm:us-east-1:123456789012:certificate/abc123"
}

variable "target_port" {
  default = 8080
}

variable "vpc_id" {
  default = "vpc-xyz789"
}

variable "sg_name" {
  default = "sg-load-balancer"
}

variable "aws_region" {
  default = "us-east-1"
}
