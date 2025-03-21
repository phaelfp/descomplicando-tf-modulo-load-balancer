# Projeto de Conclusão de Curso do Descomplicando Terraform

## Modulo de Load Balancer (alb)

Este módulo é responsável por criar um Load Balancer da porta 443/80

A documentação do módulo gerada pelo terraform-docs se encontra [aqui](README.TF.md)

## Exemplo de uso

Tem um exemplo completo do uso no diretório exemple caso queira ir logo para a parte prática.

Precisamos da seguinte estrutura de arquivos.

```css
│── main.tf
│── provider.tf
│── variables.tf
│── outputs.tf
```

### provider.tf

```tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

```

### variavles.tf

```tf
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


```

Temos aqui 6 variáveis

- Uma para idendificar a região.
- Uma lista com as subnet onde o Load Balancer será criado
- O ARN do certificado SSL
- A porta do destino backend que o Load Balancer envaminhara o redirecionamento
- O ID da VPC onde os recursos serão implantados
- O nome do Security Group que será usado para buscar o ID

### main.tf

```tf
module "alb" {
  source      = "../"
  subnets     = var.subnets
  cert_arn    = var.cert_arn
  target_port = var.target_port
  vpc_id      = var.vpc_id
  sg_name     = var.sg_name
}

```

Este main.tf o source está apontando para a pasta raiz, mas se você estiver já utilizando o módulo em outro utilize o código abaixo que está apontando para o repositório git

```tf
module "alb" {
  source      = "https://github.com/phaelfp/descomplicando-tf-modulo-load-balancer?ref=v1.0.0"
  subnets     = var.subnets
  cert_arn    = var.cert_arn
  target_port = var.target_port
  vpc_id      = var.vpc_id
  sg_name     = var.sg_name
}


```

### output.tf

```tf
output "lb_dns_name" {
  value = module.alb.lb_dns_name
}

output "lb_zone_id" {
  value = module.alb.lb_zone_id
}

```

### Execução

Tendo as chaves de acesso a AWS configuradas no terminal corretamente é só executar os comando abaixo.

```sh
terraform init
terraform plan -out tfplan
terraform apply "tfplan"
```
