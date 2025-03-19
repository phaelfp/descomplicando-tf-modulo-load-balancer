module "alb" {
  source      = "../"
  subnets     = var.subnets
  cert_arn    = var.cert_arn
  target_port = var.target_port
  vpc_id      = var.vpc_id
  sg_name     = var.sg_name
}
