<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.91.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.existing_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Região da AWS | `string` | `"us-east-1"` | no |
| <a name="input_cert_arn"></a> [cert\_arn](#input\_cert\_arn) | ARN do certificado SSL no ACM. | `string` | n/a | yes |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Nome do Security Group para buscar o ID | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Lista de IDs das subnets onde o Load Balancer será criado. | `list(string)` | n/a | yes |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | Porta do destino (backend) para o Load Balancer encaminhar o tráfego. | `number` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID da VPC onde os recursos serão implantados. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | n/a |
| <a name="output_lb_zone_id"></a> [lb\_zone\_id](#output\_lb\_zone\_id) | n/a |
<!-- END_TF_DOCS -->