


module "jenkin_master_sg" {
  source = "../modules/aws-sec-grp"

  name        = "jenkins-master-sg"
  description = "Security group for Jenkins Master"
  vpc_id      = module.vpc.vpc_id

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "ALL"
      description = "All Outbound Traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  ingress_cidr_blocks      = ["10.0.0.0/16"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8081
      protocol    = "tcp"
      description = "Jenkins-Port"
      cidr_blocks = "10.0.0.0/16"
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "jenkin_master_alb_sg" {
  source = "../modules/aws-sec-grp"

  name        = "jenkins-master-alb-sg"
  description = "Security group for Jenkins Master ALB"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Jenkins-Port-HTTP"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "ALL"
      description = "All Outbound Traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
