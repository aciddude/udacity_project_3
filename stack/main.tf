## Set the provider
provider "aws" {
  region = var.aws_region
}

# Create a VPC
module "vpc" {
  source = "./modules/aws-vpc"

  name = var.stack_name

  cidr = "10.0.0.0/16"

  azs             = [
                      data.aws_availability_zones.available.names[0],
                      data.aws_availability_zones.available.names[1],
                      data.aws_availability_zones.available.names[2]
                    ]
  private_subnets = [
                      "10.0.1.0/24",
                      "10.0.2.0/24",
                      "10.0.3.0/24"
                    ]
  public_subnets  = [
                      "10.0.101.0/24",
                      "10.0.102.0/24",
                      "10.0.103.0/24"
                    ]

  assign_generated_ipv6_cidr_block = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = false
  single_nat_gateway = false


  tags = {
    Owner       = var.owner
    Environment = var.environment
  }

  # vpc_tags = {
  #   Name = var.stack_name
  # }
}
