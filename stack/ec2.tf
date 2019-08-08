



module "ec2" {
  source = "../modules/aws-ec2-instance"

  instance_count = 1

  name          = "Jenkins-Master"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_ids    = module.vpc.private_subnets
  //  private_ips                 = ["172.31.32.5", "172.31.46.20"]
  vpc_security_group_ids      = [module.jenkin_master_sg.this_security_group_id]
  associate_public_ip_address = false
  //   placement_group             = aws_placement_group.web.id

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]

  tags = {
    "Owner"       = var.owner
    "Environment" = var.environment
    "Name"        = var.stack_name
  }
}
