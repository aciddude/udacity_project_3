

module "jenkins-master-alb" {
  source  = "../modules/aws-alb"

  load_balancer_name            = "${var.stack_name}-alb"
  security_groups               = [module.jenkin_master_alb_sg.this_security_group_id]
  log_bucket_name               = "alb-logs-udacity"
  log_location_prefix           = "jenkins-master-"
  subnets                       = [module.vpc.public_subnets[0],module.vpc.public_subnets[1], module.vpc.public_subnets[2] ]
  tags = {
    "Owner"       = var.owner
    "Environment" = var.environment
    "Name"        = var.stack_name
  }
  vpc_id                        = module.vpc.vpc_id
  //https_listeners               = "${list(map("certificate_arn", "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012", "port", 443))}"
  https_listeners_count         = "0"
  http_tcp_listeners            = "${list(map("port", "80", "protocol", "HTTP"))}"
  http_tcp_listeners_count      = "1"
  target_groups                 = "${list(map("name", "jenkins-master-tg", "backend_protocol", "HTTP", "backend_port", "8080"))}"
  target_groups_count           = "1"
}


resource "aws_lb_target_group_attachment" "jenkins-master" {
  target_group_arn = module.jenkins-master-alb.target_group_arns[0]
  target_id        = module.jenkins-master.id[0]
  port             = 8080
}
