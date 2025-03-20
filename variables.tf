variable "subnets" {
  description = "Lista de IDs das subnets onde o Load Balancer será criado."
  type        = list(string)
}

variable "cert_arn" {
  description = "ARN do certificado SSL no ACM."
  type        = string
}

variable "target_port" {
  description = "Porta do destino (backend) para o Load Balancer encaminhar o tráfego."
  type        = number
}

variable "vpc_id" {
  description = "ID da VPC onde os recursos serão implantados."
  type        = string
}

variable "sg_name" {
  description = "Nome do Security Group para buscar o ID"
  type        = string
}
