


module "jenkin_master_sg" {
  source = "../modules/aws-sec-grp"

  name        = "jenkin_master_sg"
  description = "Security group for Jenkins Master, with ports open within VPC"
  vpc_id      =  module.vpc.vpc_id

  ingress_cidr_blocks = ["10.10.0.0/16"]
}
